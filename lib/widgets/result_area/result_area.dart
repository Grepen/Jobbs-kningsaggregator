import 'package:flutter/material.dart';

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


    Future refresh() async {


        setState(() {
            items.clear();          
        });




        setState(() {
            items = ['hehjehe', 'ööööö', "äääää"];
        });
    }

    @override
    Widget build(BuildContext context){
        return RefreshIndicator(
            onRefresh: refresh,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                    final item = items[index];

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
                        item,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                } 
                
            
            )
        );
    }
}