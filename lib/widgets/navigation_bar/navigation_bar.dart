import 'package:flutter/material.dart';
import 'package:jobbagregator/widgets/search_bar/search_bar.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class Navbar extends StatefulWidget  {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar>  {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[SearchBarApp()],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 120,
              height: 40,
              child: AnimatedToggleSwitch<bool>.dual(
                current: positive,
                first: false,
                second: true,
                spacing: 50.0,
                style: const ToggleStyle(
                  borderColor: Colors.transparent,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                borderWidth: 5.0,
                height: 55,
                onChanged: (b) => setState(() => positive = b),
                styleBuilder: (b) =>
                    ToggleStyle(indicatorColor: b ? Color.fromARGB(255, 91, 43, 60) : Color.fromARGB(255, 91, 43, 60)),
                iconBuilder: (value) => value
                    ? Icon(Icons.search, color:Colors.white)
                    : Icon(Icons.public, color:Colors.white),
                textBuilder: (value) => value
                    ? Center(child: Text('Spes'))
                    : Center(child: Text('Alla')),
            ),
          )
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
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
