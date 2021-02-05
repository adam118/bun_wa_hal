import 'package:badges/badges.dart';
import 'package:bun_wa_hal/auth/chose.dart';
import 'package:bun_wa_hal/model/cart.dart';
import 'package:bun_wa_hal/model/item.dart';
import 'package:bun_wa_hal/order/finalscreen.dart';
import 'package:bun_wa_hal/order/getfrompalce.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../main.dart';

void min() {
  print("hello");
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: coffee1(),
    ),
  ));
}

bool getFromPlaces = false;
final List<FireBaseItem> fbitem = [];
double currentsliderval = 250;
double price = 2;
double containHeal = 0.5;
double f = 3;
double s = 5;
String getFromPlaced = '';
String groupval3 = "";
DatabaseReference _counterRef;
double th = 9;
double fth = 13;
bool heal = false;
int indexs = fbitem.length;
double maxValue = maxValue > 0 ? maxValue : 1000;
String groubVal = cookinglevels;
String groubVal2 = '';
String cookinglevels = "";
int size = 250;

String adma = "lg";
final Future<FirebaseApp> _initialization = Firebase.initializeApp();

// ignore: camel_case_types
class coffee1 extends StatefulWidget {
  @override
  _coffee1State createState() => _coffee1State();
}

// ignore: camel_case_types
class _coffee1State extends State<coffee1> {
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
        title: 'قهوة تركية',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => coffee1()));
          },
          child: Image.asset(
            "Images/coffee.png",
            scale: 0.5,
          ),
        ),
        blond: Radio(
          activeColor: Colors.brown,
          hoverColor: Colors.brown,
          value: "blond",
          groupValue: groubVal,
          onChanged: (val) {
            groubVal = val;
            setState(() {
              cookinglevels = "شقراء";
            });
          },
        ),
        medium: Radio(
          activeColor: Colors.brown,
          hoverColor: Colors.brown,
          value: "meadiam",
          groupValue: groubVal,
          onChanged: (val) {
            groubVal = val;
            setState(() {
              cookinglevels = "وسط";
            });
          },
        ),
        quarter: Radio(
          activeColor: Colors.brown,
          hoverColor: Colors.brown,
          value: '1',
          groupValue: groubVal2,
          onChanged: (val) {
            groubVal2 = val;
            setState(() {
              size = 250;
              price = price + 0;
            });
          },
        ),
        half: Radio(
          activeColor: Colors.brown,
          hoverColor: Colors.brown,
          value: '2',
          groupValue: groubVal2,
          onChanged: (val) {
            groubVal2 = val;
            setState(() {
              size = 500;
              price = price + 2;
            });
          },
        ),
        one: Radio(
          activeColor: Colors.brown,
          hoverColor: Colors.brown,
          value: '3',
          groupValue: groubVal2,
          onChanged: (val) {
            groubVal2 = val;
            setState(() {
              size = 1000;
              if (size == 1000) {
                price = price + 8;
              }
            });
          },
        ),
        dark: Radio(
          activeColor: Colors.brown,
          hoverColor: Colors.brown,
          value: "Dark",
          groupValue: groubVal,
          onChanged: (val) {
            groubVal = val;
            setState(() {
              cookinglevels = "غامقة";
            });
          },
        ),
        dep: CheckboxListTile(
          activeColor: Colors.brown,
          title: Text("مع هيل",
              textAlign: TextAlign.left,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
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
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    void _showSnackBar() {
      print("Show Snackbar here !");
      final snackBar = new SnackBar(
        content: new Text("This is a SnackBar"),
        duration: new Duration(seconds: 3),
        backgroundColor: Colors.green,
        action: new SnackBarAction(
            label: 'Ok',
            onPressed: () {
              print('press Ok on SnackBar');
            }),
      );
      //How to display Snackbar ?
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

// Find the Scaffold in the widget tree and use it to show a SnackBar.
    return MaterialApp(
        theme: isDark ? ThemeData.light() : ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Consumer<Cart>(builder: (
          context,
          cart,
          child,
        ) {
          return Scaffold(
              key: _scaffoldKey,
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
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.brown),
                elevation: 0,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'Images/logo.png',
                    scale: 10,
                  ),
                ),
                centerTitle: true,
                actions: <Widget>[
                  cart.bascket.length == 0
                      ? IconButton(
                          icon: Icon(Icons.shopping_bag),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => check_out()));
                          })
                      : _shoppingCartBadge()
                ],
              ),
              body: SingleChildScrollView(
                  child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    //Image
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => coffee1()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side:
                                    BorderSide(color: Colors.brown, width: 4)),
                            child: Container(
                              height: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'Images/coffee.png',
                                      scale: 7,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                items[indexs].title,
                                                style: GoogleFonts.cairo(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.green,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Turkish coffee",
                                                style: GoogleFonts.cairo(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.green,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //end Image
                    //addons(size)
                    Container(
                      width: double.infinity,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          "الوزن",
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Spacer(),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              Text("وقية",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              (items[indexs].quarter)
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              Text("نصف كيلو",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              (items[indexs].half)
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              Text("كيلو",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              (items[indexs].one)
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    //end addons(size)
                    //addons(cookinglevel)
                    Container(
                      width: double.infinity,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          "درجة التحميص",
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Spacer(),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              Text("فاتحة",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              (items[indexs].blond)
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              Text("وسط",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              (items[indexs].medium)
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              Text("غامقة",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              (items[indexs].dark)
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    //end addons(cookinglevel)
                    //addons (Heal)
                    Container(
                      width: double.infinity,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          "اضافات",
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    (items[indexs].dep),
                    //end addons(Heal)

                    //add to cart buttons
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 0, right: 28, left: 28),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: FlatButton(
                                          color: Colors.green,
                                          child: Row(
                                            children: [
                                              Text(
                                                items[indexs].price.toString(),
                                                style: GoogleFonts.cairo(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 30),
                                              ),
                                              Text(
                                                "  JD",
                                                style: GoogleFonts.cairo(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.brown,
                                                    fontSize: 22),
                                              ),
                                            ],
                                          ),
                                          splashColor: Colors.green,
                                          onPressed: () {}),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              FlatButton(
                                onPressed: () {
                                  _showSnackBar();
                                  setState(() {
                                    cart.add(items[indexs]);
                                    displayAddd(context);
                                    setState(() {
                                      fbitem.add(
                                        FireBaseItem(
                                          title: (items[indexs].title),
                                          price: (items[indexs].price),
                                          cookingLevel: cookinglevels,
                                          containHeal: heal,
                                          size: currentsliderval,
                                        ),
                                      );
                                      print(FireBaseItem(
                                        title: (items[indexs].title),
                                      ));
                                    });
                                  });
                                },
                                child: Image.asset(
                                  "Images/add.png",
                                  scale: 1.5,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )));
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

Widget _shoppingCartBadge() {
  return Consumer<Cart>(builder: (context, cart, child) {
    return Badge(
        position: BadgePosition.topEnd(top: 0, end: 3),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.scale,
        badgeContent: Text(
          cart.bascket.length.toString(),
          style: TextStyle(color: Colors.white),
        ),
        child: IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => check_out()));
            }));
  });
}

void displayAddd(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(
            Duration(
              seconds: 2,
            ), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        });
        return AlertDialog(
          elevation: 30,
          backgroundColor: Colors.green,
          title: Container(
            height: 100,
            width: 200,
            child: Center(
              child: Text(
                "تمت اضافت هاذا المنتج بنجاح",
                style: GoogleFonts.cairo(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        );
      });
}

class check_out extends StatefulWidget {
  @override
  _check_outState createState() => _check_outState();
}

bool basjd = false;

class _check_outState extends State<check_out> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.brown),
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'Images/logo.png',
                scale: 10,
              ),
            ),
            centerTitle: true,
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {});
                      })
                ],
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Image.asset(
                    "Images/logo.png",
                    width: 52,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text('الرئيسية'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart_outlined),
                  title: Text('العربة'),
                  onTap: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text('حسابي'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => chose()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.loyalty_outlined),
                  title: Text('نقاطي'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => chose()));
                  },
                ),
              ],
            ),
          ),
          body: cart.bascket.length == 0
              ? Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 170,
                      ),
                      Text("The cart is empty 😕"),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        child: Text("Go and buy something"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 350,
                        child: ListView.builder(
                            itemCount: cart.bascket.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: Colors.brown, width: 2.5)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      child: ListTile(
                                        trailing: IconButton(
                                            onPressed: () {
                                              cart.remove(cart.bascket[index]);
                                            },
                                            icon:
                                                FaIcon(FontAwesomeIcons.trash)),
                                        leading: Container(
                                            child: (cart.bascket[index].image)),
                                        title: Column(
                                          textBaseline: TextBaseline.alphabetic,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              cart.bascket[index].title,
                                            ),
                                            Text(
                                              cart.bascket[index].price
                                                      .toString() +
                                                  "د.أ",
                                            ),
                                            Text(
                                              cookinglevels,
                                            ),
                                            Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child:
                                                    (cart.bascket[index].dep)),
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 150,
                          child: Row(
                            children: [
                              Spacer(),
                              Text("استلام من الفرع",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              Radio(
                                groupValue: getFromPlaced,
                                onChanged: (val) {
                                  getFromPlaced = val;
                                  setState(() {
                                    getFromPlaces = true;
                                    if (getFromPlaces == true) {}
                                  });
                                },
                                value: 'getfrom',
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: Container(
                            width: 150,
                            child: Row(
                              children: [
                                Spacer(),
                                Text("توصيل",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )),
                                Radio(
                                  groupValue: getFromPlaced,
                                  onChanged: (val) {
                                    getFromPlaced = val;

                                    setState(() {
                                      getFromPlaces = false;
                                      if (getFromPlaces == false) {}
                                    });
                                  },
                                  value: 'delevery',
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                color: Colors.brown,
                                height: 70,
                                width: 150,
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      cart.totalprice.toString(),
                                      style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 30),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            height: 70,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: RaisedButton(
                                color: Colors.green,
                                onPressed: () {
                                  if (getFromPlaces == false) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contaxt) =>
                                                checkout_Screen_final()));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contaxt) =>
                                                getFromPlace()));
                                  }
                                },
                                child: Text("متابعة",
                                    style: GoogleFonts.cairo(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 20)),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
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
