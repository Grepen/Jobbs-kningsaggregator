import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Result extends StatelessWidget {
  final Map<String, dynamic> item;

  const Result({Key? key, required this.item}) : super(key: key);

  @override Widget build(BuildContext context) {
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
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                item['title'],
                style: TextStyle(fontSize: 18),
              ),
              Spacer(),
              Link(
                target: LinkTarget.blank,
                uri: Uri.parse(item['link']), 
                builder: (context, followLink) => TextButton(
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll<Color>(Color.fromARGB(47, 91, 43, 60)),
                  ),
                  onPressed: followLink, 
                  
                  child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Länk ",
                        style: TextStyle(fontSize: 18)
                      ),
                      WidgetSpan(
                        child: Icon(Icons.open_in_new, color:Color.fromARGB(255, 91, 43, 60), size: 19,)
                      ),
                    ]
                    )
                  ),
                  )
                )
            ],
            ),
            SizedBox(height: 14,),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.card_travel_outlined, color:Color.fromARGB(255, 91, 43, 60), size: 22,)
                      ),
                      
                      TextSpan(
                        text: " " + item['company'],
                        style: TextStyle(fontSize: 18)
                      ),
                    ]
                    )
                  ),
                  SizedBox(width: 15),
                  RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.location_on_outlined, color:Color.fromARGB(255, 91, 43, 60), size: 22)
                      ),
                      
                      TextSpan(
                        text: "" + item['location'],
                        style: TextStyle(fontSize: 18)
                      ),
                    ]
                    )
                  ),
                  SizedBox(width: 20),
                  RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.computer, color:Color.fromARGB(255, 91, 43, 60), size: 20)
                      ),
                      
                      TextSpan(
                        text: " " + item['website'],
                        style: TextStyle(fontSize: 18)
                      ),
                    ]
                    )
                  )
              ],
              )
        ],
      )
      
    );
  }


}