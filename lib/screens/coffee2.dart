import 'package:bun_wa_hal/model/cart.dart';
import 'package:bun_wa_hal/model/item.dart';
import 'package:bun_wa_hal/screens/coffee1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

void min() {
  print("hello");
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Coffee2(),
    ),
  ));
}

double currentsliderval = 250;
String adma = "lg";

// ignore: camel_case_types
class Coffee2 extends StatefulWidget {
  @override
  _Coffee2State createState() => _Coffee2State();
}

double price = 2;
double containHeal = 0.5;
double f = 3;
double s = 5;
DatabaseReference _counterRef;
double th = 9;
double fth = 13;
bool heal = false;
double maxValue = maxValue > 0 ? maxValue : 1000;
String groubVal = '';
String cookinglevels = "";

final List<FireBaseItem> fbitem = [];

class _Coffee2State extends State<Coffee2> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<UserItem> items = [
      UserItem(
        title: 'قهوة 2',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Coffee2()));
          },
          child: Image.network(
            "https://feedo.shop/image/cache/catalog/Products%20Images/Soft-Drinks-Tea-Coffee/Tea-Coffee-Hot-Drinks/Coffee/Haseeb-Without-Cardamom-Coffee-200g-550x550.jpg",
          ),
        ),
        blond: Radio(
          value: '1',
          groupValue: groubVal,
          onChanged: (val) {
            groubVal = val;
            setState(() {
              cookinglevels = "شقراء";
            });
          },
        ),
        medium: Radio(
          value: '2',
          groupValue: groubVal,
          onChanged: (val) {
            groubVal = val;
            setState(() {
              cookinglevels = "وسط";
            });
          },
        ),
        dark: Radio(
          value: '3',
          groupValue: groubVal,
          onChanged: (val) {
            groubVal = val;
            setState(() {
              cookinglevels = "غامقة";
            });
          },
        ),
        dep: CheckboxListTile(
          title: Text("مع هيل"),
          value: heal,
          onChanged: (newValue) {
            setState(() {
              heal = newValue;
              if (heal == true) {
                price += containHeal;
              } else {
                price -= containHeal;
              }
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        containHeal: heal,
        price: price,
      ),
    ];
    return MaterialApp(
        theme: isDark ? ThemeData.light() : ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Consumer<Cart>(builder: (
          context,
          cart,
          child,
        ) {
          return Scaffold(
              drawer: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Image.asset(
                        "Images/tic_logo.png",
                        width: 52,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    ListTile(
                      title: Text('home'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                    ),
                    ListTile(
                      title: Text('cart'),
                      onTap: () {
                        // Update the state of the app.
                        // ...

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => check_out()));
                      },
                    ),
                    ListTile(
                      title: Text(
                          "press me if you want to set an emgarnsy meeting"),
                      onTap: () {
                        showDialog(
                            context: context,
                            child: new AlertDialog(
                                backgroundColor: Colors.red,
                                title: Center(
                                  child: new Text(
                                    "are you sure thet you want to make an emgarnsy meeting",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                content: Row(
                                  children: <Widget>[
                                    FlatButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          displayBottomSheet(context);
                                        },
                                        child: Text(
                                          "Yes,Iam sure",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    SizedBox(
                                      width: 45,
                                    ),
                                    FlatButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "No,Iam not sure",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                  ],
                                )));
                      },
                    )
                  ],
                ),
              ),
              appBar: AppBar(
                title: Text("tic world"),
                centerTitle: true,
                actions: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                          top: 7,
                          bottom: 20,
                          right: 20,
                          left: 28,
                          child: Text(cart.count.toString())),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => check_out()));
                                },
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                ))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              body: Container(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                        child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () {},
                          title: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Image.network(
                                    "https://feedo.shop/image/cache/catalog/Products%20Images/Soft-Drinks-Tea-Coffee/Tea-Coffee-Hot-Drinks/Coffee/Haseeb-Without-Cardamom-Coffee-200g-550x550.jpg",
                                  ),
                                ],
                              ),
                              Text(items[index].title),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    (items[index].dep),
                                    Slider(
                                        divisions: 4,
                                        label: currentsliderval
                                                .toInt()
                                                .toString() +
                                            "$adma",
                                        max: 1000,
                                        min: 250,
                                        value: currentsliderval,
                                        onChanged: (double slider) {
                                          setState(() {
                                            if (currentsliderval == 250) {
                                              setState(() {
                                                price += f;
                                              });
                                            } else {
                                              price -= f;
                                            }

                                            if (currentsliderval == 437) {
                                              setState(() {
                                                price += s;
                                              });
                                            } else {
                                              price -= s;
                                            }

                                            if (currentsliderval == 625) {
                                              setState(() {
                                                price += th;
                                              });
                                            } else {
                                              price -= th;
                                            }
                                            if (currentsliderval == 1000) {
                                              setState(() {
                                                adma = "kg";
                                                price += fth;
                                              });
                                            } else {
                                              price -= fth;
                                            }
                                            currentsliderval = slider;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    (items[index].blond),
                                    (items[index].medium),
                                    (items[index].dark),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: RaisedButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Center(
                                            child: Text(
                                          "add to cart",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                        Text(items[index].price.toString()),
                                      ],
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        cart.add(items[index]);
                                        setState(() {
                                          fbitem.add(
                                            FireBaseItem(
                                              title: (items[index].title),
                                              price: (items[index].price),
                                              cookingLevel: cookinglevels,
                                              containHeal: heal,
                                              size: currentsliderval,
                                            ),
                                          );
                                          print(FireBaseItem(
                                            title: (items[index].title),
                                          ));
                                        });
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
                  },
                ),
              ));
        }));
  }
}

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 5),
                  child: Text("no dATA")),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("The Emergency meeting is dated secsfuly ☠☠"),
              ),
            ],
          )),
        );
      });
}

void displayBotStomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 5),
                  child: Text("no dATA")),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("The Emergency meeting is dated secsfuly ☠☠"),
              ),
            ],
          )),
        );
      });
}

void done(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 5),
                  child: Text("no dATA")),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("the order is plasd scsuffly ✔"),
              ),
            ],
          )),
        );
      });
}
