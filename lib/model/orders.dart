import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bun_wa_hal/model/item.dart';
import 'package:flutter/material.dart';

class Orders with ChangeNotifier {
  List<FireBaseItem> _orders = [];
  List<FireBaseItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<FireBaseItem> cartProducts, double total) async {
    final url = 'https://e-commers-app-demo-default-rtdb.firebaseio.com/';
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            'id': DateTime.now().toString(),
            'price': total,
            'dateTime': timeStamp.toString(),
            'products': cartProducts
                .map((cp) => {
                      'add_ons': cp.cookingLevel,
                      'title': cp.title,
                      'containHeal': cp.containHeal,
                      'price': cp.price,
                      'size': cp.size
                    })
                .toList(),
          }));
      _orders.insert(
          0,
          FireBaseItem(
            itemId: json.decode(response.body)['name'],
            price: total,
          ));
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}

// // import 'dart:convert';
// // import 'package:firebase_auth/firebase_auth.dart';

// // import 'cart.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:cart/model/item.dart';
// // import 'package:flutter/cupertino.dart';
// // import './cart.dart';

// // class OrderItem {
// //   final String id;
// //   double fatora = 0;
// //   final double price;
// //   final List<Item> products;
// //   final DateTime dateTime;

// //   OrderItem({
// //     @required this.id,
// //     @required this.price,
// //     @required this.products,
// //     @required this.dateTime,
// //   });
// // }

// // class Orders with ChangeNotifier {
// //   List<OrderItem> _orders = [];

// //   List<OrderItem> get orders {
// //     return [..._orders];
// //   }

// //   Future<void> addOrder(List<Item> cartProducts, double total) async {
// //     final url = 'https://cart-9b324.firebaseio.com/orders.json';
// //     final timeStamp = DateTime.now();
// //     try {
// //       final response = await http.post(url,
// //           body: json.encode({
// //             'id': DateTime.now().toString(),
// //             'price': total,
// //             'dateTime': timeStamp.toString(),
// //             'products': cartProducts
// //                 .map((cp) => {
// //                       'id': cp.fatora,
// //                       'title': cp.title,
// //                       'depenses': cp.dep,
// //                       'price': cp.price,
// //                     })
// //                 .toList(),
// //           }));
// //       _orders.insert(
// //           0,
// //           OrderItem(
// //               id: json.decode(response.body)['name'],
// //               price: total,
// //               dateTime: timeStamp,
// //               products: cartProducts));
// //       notifyListeners();
// //     } catch (err) {
// //       throw err;
// //     }
// //   }
// // }
