import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_crud/element/constant.dart';
import 'package:flutter_firebase_crud/screen/account.dart';
import 'package:flutter_firebase_crud/screen/history.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var username = TextEditingController();
  var password = TextEditingController();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      name.text = documentSnapshot['name'];
      username.text = documentSnapshot['username'];
      password.text = documentSnapshot['password'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: username,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: password,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: primaryColor,
                  child: const Text( 'Update', style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                      final uname = name.text;
                      final uuname = username.text;
                      final upass = password.text;
                      await _users
                            .doc(documentSnapshot!.id)
                            .update({"name": uname, "username": uuname, "password": upass});
                        Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }


   Future<void> delete(String userId) async {
    await _users.doc(userId).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a User')));
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healt Rate Admin'),
        automaticallyImplyLeading: false,
        actions: [
            IconButton(
              icon: Padding(
                padding: const EdgeInsets.fromLTRB(2 , 2, 15, 2),
                child: const Icon(Icons.admin_panel_settings, size: 35.0,),
              ),
              onPressed: () {
                Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Account()));
              })
        ],
        backgroundColor: primaryColor,
      ),
      body: StreamBuilder(
        stream: _users.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];

                return Card(
                  margin: EdgeInsets.all(8),
                  child: Slidable(
                    // The start action pane is the one at the left or the top side.
                    startActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: ScrollMotion(),
                      
                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (context){
                            delete(documentSnapshot.id);
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (context){
                            _update(documentSnapshot);
                          },
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                      ],
                    ),

                    // The end action pane is the one at the right or the bottom side.
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          // An action can be bigger than the others.
                          flex: 2,
                          onPressed: null,
                          backgroundColor: Color.fromARGB(255, 170, 0, 0),
                          foregroundColor: Colors.white,
                          icon: Icons.heart_broken,
                          label: documentSnapshot['rate'].toString()+' / '+documentSnapshot['rate_time'].toString(),
                        ),
                        SlidableAction(
                          flex: 2,
                          onPressed: (context){
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => History(username: documentSnapshot['username'])));
                          },
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.history,
                          label: 'History',
                        ),
                      ],
                    ),

                    // The child of the Slidable is what the user sees when the
                    // component is not dragged.
                    child: ListTile(
                      leading: IconButton(
                              icon: const Icon(Icons.person_add_alt),
                              onPressed: () {

                              }),
                      title: Text(documentSnapshot['name']),
                      subtitle: Text(documentSnapshot['username']),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
// Add new product
    );
  }
}
