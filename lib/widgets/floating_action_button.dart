import 'package:flutter/material.dart';

import '../main.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.myIcon, required this.onPressed, });

  //Attributes
 final Icon myIcon;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: SizedBox(
              child: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: Colors.green,
                foregroundColor: primaryColor,
                tooltip: 'Add User',
                onPressed: onPressed,
                child: myIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
