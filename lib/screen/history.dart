import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/element/constant.dart';

class History extends StatefulWidget {
  String username;

  History({Key? key, required this.username}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('history')
            .where('username', isEqualTo: widget.username)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: IconButton(
                              icon: const Icon(Icons.history),
                              onPressed: () {}),
                    title: Text(documentSnapshot['status'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    subtitle: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Icon(Icons.heart_broken),
                                SizedBox(width: 20.0,),
                                Text(documentSnapshot['rate']+' / '+documentSnapshot['rate_time']),
                              ],
                            ),
                            SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Icon(Icons.lock_clock),
                                SizedBox(width: 20.0,),
                                Text(documentSnapshot['occur_date_time']),
                              ],
                            ),

                          ],
                        ),
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
    );
  }

}
