import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color btnColor;
  final String title;
  final Function fun;

  RoundedButton({@required this.btnColor, @required this.title, @required this.fun});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: btnColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Go to login screen.
            fun();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
      ),
    );
  }
}