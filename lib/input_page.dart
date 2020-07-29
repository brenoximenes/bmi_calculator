import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_card.dart';
import 'card_genre.dart';
import 'constants.dart';
import 'results_page.dart';
import 'botton_button.dart';
import 'round_icon_button.dart';
import 'calculator.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                corCard: selectedGender == Gender.male ? kColorCard : kInactiveColorCard,
                cardChild: CardGenre(cardIcon: FontAwesomeIcons.mars, label: 'MALE',),
              ),),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                corCard: selectedGender == Gender.female ? kColorCard : kInactiveColorCard,
                cardChild: CardGenre(cardIcon: FontAwesomeIcons.venus, label: 'FEMALE',),
              ),),
            ],
          )),
          Expanded(
            child: ReusableCard(
              corCard: kColorCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text( 'HEIGHT' , style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                    Text( height.toString(),
                    style: kDisplayTextStyle),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF111328),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 230.0,
                      onChanged: (double newValue) {
                        setState((){
                          height = newValue.round();
                        });

                      },
                    ),
                  ),
                ],
              ),
            ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:
              ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',
                    style: kLabelTextStyle),
                    Text(weight.toString(),
                    style: kDisplayTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),

                  ],
                ),
                corCard: kColorCard,),),
              Expanded(child: ReusableCard(
                cardChild: Column(
                  children: <Widget>[
                    Text('AGE',
                    style: kLabelTextStyle,),
                    Text( age.toString(),
                    style: kDisplayTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            }
                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            }
                        )

                      ],
                    )
                  ],
                ),
                corCard: kColorCard,

              ),),
            ],
          )),
          BottonButton(
            buttonTitle: 'CALCULATE',
              onTap: (){
                Calculator calc = Calculator(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculatorBMI(),
                  getResult: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),),);
              },
          ),
        ],
      ),
    );
  }
}

