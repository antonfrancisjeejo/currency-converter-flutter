// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:currency_converter_v2/currency_list.dart';
import 'package:currency_converter_v2/currencyservice.dart';
import 'package:currency_converter_v2/red_input.dart';
import 'package:currency_converter_v2/white_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage(
      {this.currencyVal,
      this.converterCurrency,
      this.currencyone,
      this.currencytwo,
      this.isWhite});

  final currencyVal;
  final converterCurrency;
  final currencyone;
  final currencytwo;
  final isWhite;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEC5759),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => CurrencyList()));
                  },
                  child: Text(
                    CurrencyService().getCurrencyString(widget.currencyone),
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => InputRedPage(
                              origCurrency: widget.currencyone,
                              convCurrency: widget.currencytwo,
                            )));
                  },
                  child: Text(
                    widget.currencyVal.toString(),
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 120,
                        color: Colors.white),
                  ),
                ),
                Text(
                  widget.currencyone,
                  style: TextStyle(
                    color: Color(0xFFFFB6B6),
                    fontSize: 17,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(62.5),
                    color: Colors.white,
                    border: Border.all(
                        color: Color(0xFFEC5759),
                        style: BorderStyle.solid,
                        width: 5),
                  ),
                  child: Center(
                      child: widget.isWhite
                          ? Icon(Icons.arrow_upward,
                              size: 60, color: Color(0xFFEC5759))
                          : Icon(Icons.arrow_downward,
                              size: 60, color: Color(0xFFEC5759))),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  widget.currencytwo,
                  style: TextStyle(
                    color: Color(0xFFEC5759),
                    fontSize: 17,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => InputWhitePage(
                              origCurrency: widget.currencyone,
                              convCurrency: widget.currencytwo,
                            )));
                  },
                  child: Text(
                    widget.converterCurrency.toString(),
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 120,
                      color: Color(0xFFEC5759),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => CurrencyList()));
                    },
                    child: Text(
                      CurrencyService().getCurrencyString(widget.currencytwo),
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 22,
                        color: Color(0xFFEC5759),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
