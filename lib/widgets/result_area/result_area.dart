import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Result_list extends StatefulWidget {
  const Result_list({super.key});

  @override
  State<Result_list> createState() => Result_list_State();
}

class Result_list_State extends State<Result_list> {
  List<String> items = List.generate(
    100,
    (index) => 'Item ${index + 1}',
  );

  final CollectionReference sampleData =
      FirebaseFirestore.instance.collection('sampleData');

  Future refresh() async {
    setState(() {
      items.clear();
    });

    setState(() {
      items = ['hehjehe', 'ööööö', "äääää"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder<QuerySnapshot>(
            future: sampleData.get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Loading indicator while data is being fetched
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    // Error handling
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  // Data has been fetched successfully
                  List<QueryDocumentSnapshot> documents = snapshot.data!.docs;



                  return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                      final item = documents[index].data() as Map<String, dynamic>;
            
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255), // Customize the color as needed
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            width: 1.0,
                            color: Color.fromARGB(255, 91, 43, 60)
                            )
                        ),
                        child: Text(
                          item['headline'],
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                  } 
                  
              
              );

            }));
  }
}
