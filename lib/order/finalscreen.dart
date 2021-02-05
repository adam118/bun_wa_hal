import 'package:bun_wa_hal/main.dart';
import 'package:bun_wa_hal/map/map.dart';
import 'package:bun_wa_hal/screens/coffee1.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class checkout_Screen_final extends StatefulWidget {
  @override
  _checkout_Screen_finalState createState() => _checkout_Screen_finalState();
}

DatabaseReference _counterRef;

class _checkout_Screen_finalState extends State<checkout_Screen_final> {
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
        actions: <Widget>[],
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.brown, width: 2)),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "عنوان التوصيل",
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 140,
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                controller: TextEditingController(),
                              ),
                            ),
                          ),
                          Text(
                            ": اختر موقع التوصيل يديوي",
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15),
                          )
                        ],
                      ),
                      Text(
                        "او اختر من الخريطة",
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => map()));
                            },
                            child: Image.asset("Images/map.png")),
                      )
                    ],
                  ),
                ),
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
                              width: 230,
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsetsDirectional.only(
                                        start: 10, end: 10, bottom: 0, top: 10),
                                    labelStyle: GoogleFonts.cairo(
                                        fontSize: 20, color: Colors.brown),
                                    hintStyle: GoogleFonts.cairo(
                                        fontSize: 20, color: Colors.brown),
                                    hintText: "اليوم/الشهر"),
                                keyboardType: TextInputType.datetime,
                                controller: TextEditingController(),
                              ),
                            ),
                          ),
                          Text(
                            ": تاريخ التوصيل",
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
                              width: 250,
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsetsDirectional.only(
                                        start: 10, end: 10, bottom: 0, top: 10),
                                    labelStyle: GoogleFonts.cairo(
                                        fontSize: 20, color: Colors.brown),
                                    hintStyle: GoogleFonts.cairo(
                                        fontSize: 20, color: Colors.brown),
                                    hintText: "مثل رجاءا لا تقرع الجرس"),
                                controller: TextEditingController(),
                              ),
                            ),
                          ),
                          Text(
                            ": ملاحظات",
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
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 70,
                  width: 150,
                  color: Colors.green,
                  child: Center(
                    child: FlatButton(
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
                          send(context);
                        }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
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

void send(BuildContext context) {
  Map<String, String> map = {
    'id': fbitem[0].itemId,
    'title': fbitem[0].title,
    'price': fbitem[0].price.toString(),
    'cookingLevel': fbitem[0].cookingLevel,
    'containHeal': fbitem[0].containHeal.toString(),
    'size': size.toString(),
  };
  _counterRef = FirebaseDatabase.instance.reference().child('Orders');
  _counterRef.push().set(<String, Map<String, String>>{'order': map});
}

void lodingCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      });
      return AlertDialog(
          title: Column(
        children: [
          Text("رجاء الانتظار"),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            backgroundColor: Colors.brown,
          )
        ],
      ));
    },
  );
}
