import 'package:flutter/material.dart';
import 'constants.dart';

class BottonButton extends StatelessWidget {
  BottonButton({@required this.onTap, this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( buttonTitle , style: kFooterTextStyle,)
          ],
        ),
        color: kColorFooter,
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kFooterHeight,
      ),
    );
  }
}
