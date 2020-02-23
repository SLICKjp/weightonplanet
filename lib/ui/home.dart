import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();
  int radioValue = 0;
  double finalResult = 0.0;
  String formattedText="";

  void handleRadioValue(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          finalResult = _calculateWeight(_weightController.text, 0.06);
          formattedText= "Your weight on Pluto is ${finalResult.toStringAsFixed(1)}";
          break;

        case 1:
          finalResult = _calculateWeight(_weightController.text, 0.38);
          formattedText= "Your weight on Mars is ${finalResult.toStringAsFixed(1)}";
          break;

        case 2:
          finalResult = _calculateWeight(_weightController.text, 0.91);
          formattedText= "Your weight on Venus is ${finalResult.toStringAsFixed(1)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weight on Planet X'),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133,
              width: 200,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.topCenter,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your weight in pounds',
                      hintText: 'in pounds',
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValue),
                      new Text(
                        'Pluto',
                        style: new TextStyle(fontSize: 18.5),
                      ),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValue),
                      new Text(
                        'Mars',
                        style: new TextStyle(fontSize: 18.5),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orange,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValue),
                      new Text(
                        'Venus',
                        style: new TextStyle(fontSize: 18.5),
                      ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(6.0)),
                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight" : formattedText,
                    style: new TextStyle(color: Colors.white, fontSize: 20.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print('wrong');
    }
    return int.parse(weight) * 0.38;
  }
}
