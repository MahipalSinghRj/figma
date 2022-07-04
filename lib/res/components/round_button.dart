import 'package:flutter/material.dart';




class Buttons extends StatelessWidget {

  final String title;
  final bool? loading;
  final VoidCallback onPress;
  final double fontSize;
  final Color backgroundColor, textColor, borderColor;

   Buttons({Key? key,
    required this.title,
    this.loading=false,
    required this.onPress,
     required this.backgroundColor,
     required this.textColor,
     required this.borderColor, required this.fontSize }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width:MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8.0),
           ),
        child:  Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),

      ),
      onTap: onPress,
    );
  }
}
