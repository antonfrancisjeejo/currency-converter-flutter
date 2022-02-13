// ignore_for_file: prefer_const_constructors

import 'package:currency_converter_v2/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList({Key? key}) : super(key: key);

  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEC5759),
      appBar: AppBar(
        backgroundColor: Color(0xFFEC5759),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          getListItem('Indian Rupee', 'INR'),
          getListItem('Russian Ruble', 'RUB'),
          getListItem('Japanese Yen', 'JPY'),
          getListItem('Pound Sterling', 'GBP'),
        ],
      ),
    );
  }

  Widget getListItem(String currencyName, String currency) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (context) => DashboardPage(
              currencyVal: 0,
              isWhite: false,
              converterCurrency: 0,
              currencyone: 'USD',
              currencytwo: currency,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
        child: Text(
          currencyName,
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
