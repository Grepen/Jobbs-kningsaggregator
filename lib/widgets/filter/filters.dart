import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  _Filters createState() => _Filters();
}

class _Filters extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Container(
                width: 300,
                height: 1.5, // Adjust the width of the vertical line
                color: Color.fromARGB(
                    255, 91, 43, 60), // Set the color of the vertical line
              ),
              SizedBox(
                      height:
                          12),
              Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  color: Color.fromARGB(255, 91, 43, 60),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ToggleSwitch(
                    minHeight: 35,
                    minWidth: 122,
                    cornerRadius: 8.0,
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    activeBgColor: [Colors.white],
                    activeFgColor: Color.fromARGB(255, 91, 43, 60),
                    inactiveBgColor: Color.fromARGB(255, 91, 43, 60),
                    inactiveFgColor: Color.fromARGB(255, 255, 255, 255),
                    labels: ['Offentlig Sektor', 'Privat Sektor'],
                    radiusStyle: true,
                    customTextStyles: [
                      TextStyle(
                        fontSize: 12,
                      )
                    ],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer()
      ],
    );
  }
}
