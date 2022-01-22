import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _show = true;
  bool get show => _show;

  int _index = 0;
  int get currentIndex => _index;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void shouldShow() {
    _show = !show;
    notifyListeners();
  }

  void onChanged(int index) {
    _index = index;
    notifyListeners();
  }

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
