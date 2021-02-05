import 'package:bun_wa_hal/main.dart';
import 'package:bun_wa_hal/screens/coffee1.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class getFromPlace extends StatefulWidget {
  @override
  _getFromPlaceState createState() => _getFromPlaceState();
}

TextEditingController pass = TextEditingController();
DatabaseReference _counterRef;
DateTime currentDate = DateTime.now();

class _getFromPlaceState extends State<getFromPlace> {
  String chose = "";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2022));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            ListTile(
              title: Text('cart'),
              onTap: () {
                // Update the state of the app.
                // ...

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => check_out()));
              },
            ),
            ListTile(
              title: Text("press me if you want to set an emgarnsy meeting"),
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
                                onPressed: () {},
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Text("الرجاء الاختيارمن احد هذه الافرع",
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 25)),
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              children: [
                Container(
                  color:
                      chose == "الهاشمي الشمالي" ? Colors.green : Colors.white,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        chose = "الهاشمي الشمالي";
                      });
                    },
                    title: Text("فرع الهاشمي الشمالي",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: chose == "الهاشمي الشمالي"
                                ? Colors.white
                                : Colors.black,
                            fontSize: chose == "الهاشمي الشمالي" ? 20 : 15)),
                    trailing: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.mapMarked,
                        color: chose == "الهاشمي الشمالي"
                            ? Colors.white
                            : Colors.grey,
                      ),
                      onPressed: () {
                        launch(
                            'https://www.google.com/maps/place/%D9%85%D8%AD%D9%85%D8%B5+%D8%A8%D9%86+%D9%88%D9%87%D8%A7%D9%84%E2%80%AD/@31.9173612,35.9426462,16.25z/data=!4m8!1m2!2m1!1z2YLZh9mI2Kkg2KjZhiDZiCDZh9in2YQ!3m4!1s0x151b5f15d008fc35:0x4a1f8c0b7a0c00f1!8m2!3d31.917984!4d35.9470004');
                      },
                    ),
                  ),
                ),
                Container(
                  color:
                      chose == "بيادر وادي السير" ? Colors.green : Colors.white,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        chose = "بيادر وادي السير";
                      });
                    },
                    title: Text("فرع بيادر وادي السير",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: chose == "بيادر وادي السير"
                                ? Colors.white
                                : Colors.black,
                            fontSize: chose == "بيادر وادي السير" ? 30 : 20)),
                    trailing: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.mapMarked,
                        color: chose == "بيادر وادي السير"
                            ? Colors.white
                            : Colors.grey,
                      ),
                      onPressed: () {
                        launch(
                            'https://www.google.com/maps/dir/31.9796982,35.9696649/31.9534775,35.8331356/@31.946683,35.8330346,15.79z/data=!4m4!4m3!1m1!4e1!1m0');
                      },
                    ),
                  ),
                ),
                Container(
                  color: chose == "مكة مول" ? Colors.green : Colors.white,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        chose = "مكة مول";
                      });
                    },
                    title: Text("فرع مكة مول",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: chose == "مكة مول"
                                ? Colors.white
                                : Colors.black,
                            fontSize: chose == "مكة مول" ? 30 : 20)),
                    trailing: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.mapMarked,
                        color: chose == "مكة مول" ? Colors.white : Colors.grey,
                      ),
                      onPressed: () {
                        launch(
                            'https://www.google.com/maps/place/%D9%85%D8%AD%D9%85%D8%B5+%D8%A8%D9%86+%D9%88%D9%87%D8%A7%D9%84%E2%80%AD/@31.9173612,35.9426462,16.25z/data=!4m8!1m2!2m1!1z2YLZh9mI2Kkg2KjZhiDZiCDZh9in2YQ!3m4!1s0x151b5f15d008fc35:0x4a1f8c0b7a0c00f1!8m2!3d31.917984!4d35.9470004');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.brown, width: 2)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, bottom: 18.0, left: 10),
                          child: Container(
                            width: 220,
                            child: TextFormField(
                                textAlign: TextAlign.right,
                                expands: false,
                                readOnly: true,
                                onTap: () {
                                  _selectDate(context);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsetsDirectional.only(
                                      start: 6, end: 6, bottom: 0, top: 0),
                                  hintStyle: GoogleFonts.cairo(
                                      fontSize: 20, color: Colors.brown),
                                ),
                                controller: pass),
                          ),
                        ),
                        Text(
                          ": تاريخ الاستلام",
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          chose == ""
              ? Container(
                  height: 1,
                  width: 1,
                )
              : Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 0, right: 30, left: 30),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FlatButton(
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              "ارسال الطلب",
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ),
                          onPressed: () {
                            print("completd to send order");
                            Map<String, String> map = {
                              'id': fbitem[0].itemId,
                              'title': fbitem[0].title,
                              'price': fbitem[0].price.toString(),
                              'cookingLevel': fbitem[0].cookingLevel,
                              'containHeal': fbitem[0].containHeal.toString(),
                              'size': size.toString(),
                            };
                            _counterRef = FirebaseDatabase.instance
                                .reference()
                                .child('Orders');
                            _counterRef.push().set(
                                <String, Map<String, String>>{'order': map});
                            showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 3), () {
                                  Navigator.of(context).pop(true);
                                });
                                return AlertDialog(
                                  actions: [
                                    Text("Made by : Beejo.co"),
                                    IconButton(
                                        icon: Icon(Icons.developer_mode),
                                        onPressed: () {})
                                  ],
                                  title: Text(
                                      "please wait until your order is sinding"),
                                );
                              },
                            );

                            //         .child('code');
                            // ref.putString('flutter');
                            print("i am hero tonight");
                          }),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
