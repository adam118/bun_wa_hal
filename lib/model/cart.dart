import 'package:bun_wa_hal/model/item.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  Map<String, UserItem> _items = {};

  Map<String, UserItem> get items {
    return {..._items};
  }

  List<UserItem> _item = [];
  double _totalprice = 0.0;

  void add(UserItem item) {
    _item.add(item);
    _totalprice += item.price;
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price;
    });
    return total;
  }

  void removeall(UserItem item) {
    _item.clear();
    _totalprice -= item.price;
    notifyListeners();
  }

  void remove(UserItem item) {
    _item.remove(item);
    _totalprice -= item.price;
    notifyListeners();
  }

  void rotat(UserItem item) {}

  int get count {
    return _item.length;
  }

  double get totalprice {
    return _totalprice;
  }

  List<UserItem> get bascket {
    return _item;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
