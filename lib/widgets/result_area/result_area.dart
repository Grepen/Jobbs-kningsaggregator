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

                    return ListTile(title: Text(item));
                } 
                
            
            )
        );
    }
}