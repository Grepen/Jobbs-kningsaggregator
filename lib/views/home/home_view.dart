import 'package:flutter/material.dart';
import 'package:jobbagregator/widgets/navigation_bar/navigation_bar.dart';
import 'package:jobbagregator/widgets/result_area/result_area.dart';
import 'package:jobbagregator/widgets/filter/filters.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Navbar(),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Filter widget goes here
                  Filters(),
                  // Vertical line
                  
                    
                  Container(
                  width: 1.5, // Adjust the width of the vertical line
                  color: Color.fromARGB(255, 91, 43, 60), // Set the color of the vertical line
                  ),
                  SizedBox(
                      width:
                          25), // Adjust spacing between filter and result list

                  // Result list goes here
                  Expanded(
                    child: Result_list(),
                  ),
                  SizedBox(
                      width:
                          25),
                ],
              ),
            ),
          ],
        ));
  }
}
