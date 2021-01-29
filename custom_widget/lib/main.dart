import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '0',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            children: [
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'C',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+/-',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '%',
              ),
              CalculatorButton.icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'Backspace',
                icon: Icons.backspace,
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '7',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '8',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '9',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '/',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '4',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '5',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '6',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'X',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '1',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '2',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '3',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '-',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '0',
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '.',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '=',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '+',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  IconData icon;
  final Function onTap;

  CalculatorButton({
    @required this.backgroundColor,
    @required this.foregroundColor,
    @required this.text,
    @required this.onTap,
  });

  CalculatorButton.icon({
    @required this.backgroundColor,
    @required this.foregroundColor,
    @required this.icon,
    @required this.text,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: backgroundColor,
        child: Center(
          child: icon == null
              ? Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: foregroundColor),
                )
              : Icon(
                  icon,
                  color: foregroundColor,
                ),
        ),
      ),
      onTap: onTap,
    );
  }
}
