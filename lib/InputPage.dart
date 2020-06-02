import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColor = inactiveCardColor;
Color femaleCardColor = inactiveCardColor;

upgradeColorCard(int gender) {
  if (gender == 1) {
    if (maleCardColor == inactiveCardColor) {
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
    } else {
      maleCardColor = inactiveCardColor;
    }
  }
  if (gender == 2) {
    if (femaleCardColor == inactiveCardColor) {
      femaleCardColor = activeCardColor;
      maleCardColor = inactiveCardColor;
    } else {
      femaleCardColor = inactiveCardColor;
    }
  }
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      upgradeColorCard(1);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColor,
                    cardChild:
                        IconContent(label: 'MALE', icon: FontAwesomeIcons.mars),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      upgradeColorCard(2);
                    });
                  },
                  child: ReusableCard(
                    colour: femaleCardColor,
                    cardChild: IconContent(
                        label: 'FEMALE', icon: FontAwesomeIcons.venus),
                  ),
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: activeCardColor,
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(colour: activeCardColor)),
                Expanded(child: ReusableCard(colour: activeCardColor)),
              ],
            )),
            Container(
              color: bottomContainerColor,
              width: double.infinity,
              height: bottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ],
        ));
  }
}
