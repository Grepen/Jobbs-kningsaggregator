import 'package:flutter/material.dart';
import 'package:jobbagregator/widgets/navigation_bar/navigation_bar.dart';
import 'package:jobbagregator/widgets/result_area/result_area.dart';

class HomeView extends StatelessWidget {
    const HomeView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Column(children: <Widget>[
                Navbar()
                
            ],),
        );
    }
    
}