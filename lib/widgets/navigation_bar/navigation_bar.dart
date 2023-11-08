import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
    const Navbar({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Container(
            height: 100,
            child: Row(
                children: <Widget>[
                    SizedBox(
                        height: 80,
                        width: 150,
                        child: Image.asset('assets/logo.png'),
                    ), //SizedBox
                    Row(
                      mainAxisSize: MainAxisSize.min, 
                      children: <Widget>[
                        _NavBarItem('Episodes'),
                        SizedBox(width: 60,),
                        _NavBarItem('About')
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