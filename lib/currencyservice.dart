import 'package:currency_converter_v2/dashboard.dart';
import 'package:flutter/material.dart';

class CurrencyService {
  getCurrencyString(currency) {
    if (currency == 'USD') return 'United States Dollar';
    if (currency == 'INR') return 'Indian Rupee';
    if (currency == 'JPY') return 'Japanese Yen';
    if (currency == 'RUB') return 'Russian Ruble';
    if (currency == 'GBP') return 'Pound Sterling';
  }

  convertCurrency(String fromCurrency, String toCurrency, num amount, context) {
    if (fromCurrency == 'USD') {
      switch (toCurrency) {
        case 'INR':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashboardPage(
                  currencyVal: amount,
                  converterCurrency: (amount * 75).roundToDouble(),
                  currencyone: fromCurrency,
                  currencytwo: toCurrency,
                  isWhite: false)));
          break;
        case 'JPY':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashboardPage(
                  currencyVal: amount,
                  converterCurrency: (amount * 110.48).roundToDouble(),
                  currencyone: fromCurrency,
                  currencytwo: toCurrency,
                  isWhite: false)));
          break;
        case 'RUB':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashboardPage(
                  currencyVal: amount,
                  converterCurrency: (amount * 65).roundToDouble(),
                  currencyone: fromCurrency,
                  currencytwo: toCurrency,
                  isWhite: false)));
          break;
        case 'GBP':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DashboardPage(
                  currencyVal: amount,
                  converterCurrency: (amount * 0.78).roundToDouble(),
                  currencyone: fromCurrency,
                  currencytwo: toCurrency,
                  isWhite: false)));
          break;
      }
    }
    if (fromCurrency == 'RUB') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardPage(
                currencyVal: (amount / 65).toStringAsFixed(2),
                converterCurrency: amount,
                currencyone: toCurrency,
                currencytwo: fromCurrency,
                isWhite: true,
              )));
    }

    if (fromCurrency == 'INR') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardPage(
                currencyVal: (amount * 0.014).toStringAsFixed(2),
                converterCurrency: amount,
                currencyone: toCurrency,
                currencytwo: fromCurrency,
                isWhite: true,
              )));
    }

    if (fromCurrency == 'JPY') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardPage(
                currencyVal: (amount * 0.0091).toStringAsFixed(2),
                converterCurrency: amount,
                currencyone: toCurrency,
                currencytwo: fromCurrency,
                isWhite: true,
              )));
    }
    if (fromCurrency == 'GBP') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardPage(
                currencyVal: (amount * 1.29).toStringAsFixed(2),
                converterCurrency: amount,
                currencyone: toCurrency,
                currencytwo: fromCurrency,
                isWhite: true,
              )));
    }
  }
}
