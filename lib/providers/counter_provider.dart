import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void initCount() {
    _count = 0;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count >= 0) {
      _count--;
    }
    notifyListeners();
  }
}
