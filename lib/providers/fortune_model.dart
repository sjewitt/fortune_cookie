import 'dart:math';

import 'package:flutter/material.dart';

// what is the difference between `with` and `extends`?
// - This use requires a Mixin class, but could use multiple `with` values.
// https://www.geeksforgeeks.org/dart/dart-extends-vs-with-vs-implements/:
class FortuneModel with ChangeNotifier {
  // retrueve code from main.dart:

  int _counter = 0;
  String _currFortune = "UNOVERRIDDEN";
  String _rndFortune = "UNOVERRIDDEN";

  final rnd = Random();

  final _fortuneStrings = <String>[
    "When its dark, put the cat out",
    "Never eat yellow snow",
    "Fuck the monks!",
    "Fish for sardines",
    "Ride your motorbike",
    "Sausages for breakfast...",
    "Sausages for tea...",
    "Crivens!!",
  ];

  void _incrementCounter() {
    _counter++;
    // notifyListeners();
  }

  void _decrementCounter() {
    _counter--;
    // notifyListeners();
  }

  void _setSequentialFortune() {
    _currFortune = _fortuneStrings[_counter % _fortuneStrings.length];
    // notifyListeners();
  }

  void _setRandomFortune() {
    _rndFortune = _fortuneStrings[rnd.nextInt(_fortuneStrings.length)];
    // notifyListeners();
  }

  void _triggerAddMethods() {
    _incrementCounter();
    _setSequentialFortune();
    _setRandomFortune();
    notifyListeners();
  }

  void _triggerSubtractMethods() {
    _decrementCounter();
    _setSequentialFortune();
    _setRandomFortune();
    notifyListeners();
  }

  void _resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  // specify getters for the fields we need, and expose a suitable name:

  int get counter => _counter;
  String get randomFortune => _rndFortune;
  String get currentFortune => _currFortune;
}
