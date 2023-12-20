import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobbagregator/widgets/result_area/result.dart';

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
            
                      return Result(item: item);
                  } 
                  
              
              );

            }));
  }
}
