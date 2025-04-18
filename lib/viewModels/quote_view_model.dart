import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quote/models/quote.dart';

class QuoteViewModel extends ChangeNotifier {
  List<Quote> _quotes = [];
  Quote? _currentQuote;

  // getters
  List<Quote> get quotes => _quotes;

  Quote? get currentQuote => _currentQuote;

  // initialize the quotes from the json file
  Future<void> loadQuotes() async {
    try {
      // get the quotes from the assets directory
      final String jsonString = await rootBundle.loadString(
        'assets/quotesData.json',
      );
      final List<dynamic> jsonData = json.decode(jsonString);

      _quotes = jsonData.map((data) => Quote.fromJson(data)).toList();

      // set the initial random quote
      if (_quotes.isNotEmpty) {
        getRandomQuote();
      }

      notifyListeners();
    } catch (e) {
      print('Error loading quotes: $e');
    }
  }

  void getRandomQuote() {
    if (_quotes.isEmpty) return;

    final Random random = Random();
    final int randomIndex = random.nextInt(_quotes.length);
    _currentQuote = _quotes[randomIndex];

    notifyListeners();
  }

  // copy quote text to clipboard
  Future<void> copyQuoteText() async {
    if (_currentQuote != null) {
      await Clipboard.setData(ClipboardData(text: _currentQuote!.text));
    }
  }

  // copy quote author to clipboard
  Future<void> copyQuoteAuthor() async {
    if (_currentQuote != null) {
      await Clipboard.setData(ClipboardData(text: _currentQuote!.author));
    }
  }
}
