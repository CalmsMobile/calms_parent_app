import 'package:flutter/cupertino.dart';

class ChangeProvider extends ChangeNotifier {
  int cartCount = 0;
  void setCartCount(int cartCount) {
    this.cartCount = cartCount;
    notifyListeners();
  }
}
