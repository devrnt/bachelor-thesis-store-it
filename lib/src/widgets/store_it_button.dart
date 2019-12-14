import 'package:flutter/material.dart';
import 'package:store_it/src/theme/colors.dart';

class StoreItButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height;

  StoreItButton({
    @required this.text,
    @required this.onPressed,
    this.backgroundColor = kAccent,
    this.textColor = Colors.white,
    this.height = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: backgroundColor,
        textColor: textColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
