import 'package:bun_wa_hal/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Singup(),
    );
  }
}

class Singup extends StatefulWidget {
  @override
  _SingupState createState() => _SingupState();
}

final _formKey = GlobalKey<FormState>();
DateTime currentDate = DateTime.now();
bool _valicationbirth = false;
bool showhide = false;
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController birth = TextEditingController(
    text: currentDate.year.toString() +
        "/" +
        currentDate.month.toString() +
        "/" +
        currentDate.day.toString());
TextEditingController phone = TextEditingController();
TextEditingController pass = TextEditingController();
TextEditingController passrep = TextEditingController();

class _SingupState extends State<Singup> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2025));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = new RegExp(pattern);
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              textDirection: TextDirection.rtl,
              textBaseline: TextBaseline.ideographic,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 18),
                  child: Center(
                      child: Text(
                    "انشاء الحساب",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: 30),
                  )),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        child: ListTile(
                          trailing: Icon(
                            Icons.account_circle,
                            color: Colors.brown,
                          ),
                          title: TextFormField(
                            textAlign: TextAlign.right,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'هاذا الحقل مطلوب';
                              }
                              return null;
                            },
                            expands: false,
                            maxLength: 15,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsetsDirectional.only(
                                    start: 6, end: 6, bottom: 0, top: 0),
                                hintStyle: GoogleFonts.cairo(
                                    fontSize: 20, color: Colors.brown),
                                hintText: "الأسم"),
                            controller: name,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        child: ListTile(
                          trailing: Icon(Icons.call, color: Colors.brown),
                          title: TextFormField(
                            textAlign: TextAlign.right,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'هاذا الحقل مطلوب';
                              } else if (value.length < 10) {
                                return 'الرجاء ادخال رقم هاتف صحيح';
                              } else if (!regex.hasMatch(value)) {
                                return 'الرجاء ادخال رقم هاتف صحيح , عدم وضع احرف او رموز';
                              }
                              return null;
                            },
                            onSaved: (value) {},
                            expands: false,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsetsDirectional.only(
                                    start: 6, end: 6, bottom: 0, top: 0),
                                hintStyle: GoogleFonts.cairo(
                                    fontSize: 20, color: Colors.brown),
                                hintText: "رقم الهاتف"),
                            controller: phone,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              showhide = !showhide;
                            });
                          },
                        ),
                        trailing: Icon(Icons.lock, color: Colors.brown),
                        title: TextFormField(
                          textAlign: TextAlign.right,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'هاذا الحقل مطلوب';
                            } else if (value.length < 8) {
                              return 'كلمة السر قصيرة جدا';
                            }
                            return null;
                          },
                          obscureText: showhide,
                          expands: false,
                          maxLength: 16,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsetsDirectional.only(
                                  start: 6, end: 6, bottom: 0, top: 0),
                              hintStyle: GoogleFonts.cairo(
                                  fontSize: 20, color: Colors.brown),
                              hintText: "كلمة المرور"),
                          controller: pass,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        child: ListTile(
                          trailing: Icon(Icons.lock, color: Colors.brown),
                          title: TextFormField(
                            textAlign: TextAlign.right,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'هاذا الحقل مطلوب';
                              } else if (value.length < 8) {
                                return 'كلمة السر قصيرة جدا';
                              } else if (value != pass.text) {
                                return 'لا يوجد تتطابق';
                              }
                              return null;
                            },
                            obscureText: showhide,
                            expands: false,
                            maxLength: 16,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsetsDirectional.only(
                                    start: 6, end: 6, bottom: 0, top: 0),
                                hintStyle: GoogleFonts.cairo(
                                    fontSize: 20, color: Colors.brown),
                                hintText: "تاكيد كلمة المرور"),
                            controller: passrep,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        child: ListTile(
                          trailing: Icon(Icons.cake, color: Colors.brown),
                          title: TextFormField(
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
                            controller: birth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, bottom: 0, left: 30, right: 30),
                      child: Container(
                        width: 350,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FlatButton(
                              color: Colors.green,
                              child: Text(
                                "انشاء حساب",
                                style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  sharedPreferences(context);
                                } else {
                                  return null;
                                }
                              }),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Text(
                          "انشاء حساب باستخدام",
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    width: 150,
                                    height: 50,
                                    child: FlatButton.icon(
                                      icon: FaIcon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.white,
                                      ),
                                      color: Colors.blue,
                                      label: Text(
                                        "FACEBOOK",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    width: 150,
                                    height: 50,
                                    child: FlatButton.icon(
                                      icon: FaIcon(
                                        FontAwesomeIcons.google,
                                        color: Colors.white,
                                      ),
                                      color: Colors.red,
                                      label: Text(
                                        "GOOGLE",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

sharedPreferences(BuildContext context) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setString('email', email.toString());
  sharedPreferences.setString('password', pass.toString());
  sharedPreferences.setString('phone', phone.toString());
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
}
