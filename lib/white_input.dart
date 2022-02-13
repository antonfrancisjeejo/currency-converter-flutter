// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:currency_converter_v2/currencyservice.dart';
import 'package:flutter/material.dart';

class InputWhitePage extends StatefulWidget {
  InputWhitePage({Key? key, this.origCurrency, this.convCurrency})
      : super(key: key);

  final origCurrency;
  final convCurrency;

  @override
  _InputWhitePageState createState() => _InputWhitePageState();
}

class _InputWhitePageState extends State<InputWhitePage> {
  num currInput = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              setState(() {
                currInput = 0;
              });
            },
            child: Text(
              'tap to delete',
              style: TextStyle(
                color: Color(0xFFFFB6B6),
                fontSize: 17,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              currInput.toString(),
              style: TextStyle(
                  color: Color(0xFFEC5759),
                  fontSize: 100,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          numberRow(1, 2, 3),
          SizedBox(
            height: 25,
          ),
          numberRow(4, 5, 6),
          SizedBox(
            height: 25,
          ),
          numberRow(7, 8, 9),
          SizedBox(height: 25),
          finalRow()
        ],
      ),
    );
  }

  Widget numberRow(number1, number2, number3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        number(number1),
        number(number2),
        number(number3),
      ],
    );
  }

  Widget number(number) {
    return InkWell(
      onTap: () {
        calculateNumber(number);
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Color(0xFFFFB6B6)),
        child: Center(
            child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }

  Widget finalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            // calculateNumber('.');
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(0xFFFFB6B6),
            ),
            child: Center(
                child: Text(
              '.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(0);
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(0xFFFFB6B6),
            ),
            child: Center(
                child: Text(
              '0',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        InkWell(
          onTap: () {
            CurrencyService().convertCurrency(
                widget.convCurrency, widget.origCurrency, currInput, context);
          },
          child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xFFFC1514),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 25,
                ),
              )),
        ),
      ],
    );
  }

  calculateNumber(number) {
    if (currInput == 0) {
      setState(() {
        currInput = number;
      });
    } else {
      setState(() {
        currInput = (currInput * 10) + number;
      });
    }
  }
}
