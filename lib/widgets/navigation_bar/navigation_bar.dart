import 'package:flutter/material.dart';
import 'package:jobbagregator/widgets/search_bar/search_bar.dart';


class Navbar extends StatelessWidget {
    const Navbar({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Container(
            color: Color(0xFFDAD5D1),
            height: 100,
            child: Row(
                children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min, 
                      children: <Widget>[
                        SearchBarApp()
                      ],
                    )
                ],
            ),
        );
    }
}

class _NavBarItem extends StatelessWidget {
    final String title;
    const _NavBarItem(this.title);
    
    @override
    Widget build(BuildContext context){
        return Text(title, style: TextStyle(fontSize: 18),);
    }
}