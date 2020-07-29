import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'botton_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult, this.getResult, this.interpretation});

  final String bmiResult;
  final String getResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI CALCULATOR')),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result',

            style: kTitleResultStyle,) ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                corCard: kColorCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(getResult.toUpperCase(), style: kResultType,),
                    Text(bmiResult, style: kBMITextStyle,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle),
                    ),
                  ],
                ),
            ),
          ),
          BottonButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      )
    );
  }
}
