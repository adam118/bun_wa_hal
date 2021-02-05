import 'package:bun_wa_hal/Splash.dart';
import 'package:bun_wa_hal/auth/chose.dart';
import 'package:bun_wa_hal/model/cart.dart';
import 'package:bun_wa_hal/model/item.dart';
import 'package:bun_wa_hal/screens/coffee1.dart';
import 'package:bun_wa_hal/screens/coffee2.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    ),
  ));
}

bool isDark = true;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

final List<String> imgList = [
  'Images/image1.png',
  'Images/image2.png',
];
ThemeData _themeDataDark = ThemeData.dark();
ThemeData _themeDataLight = ThemeData.light();
double currentSliderValue = 2.5;
bool containHeal1 = false;
bool containHeal2 = false;
bool containHeal3 = false;
bool containHeal4 = false;
bool containHeal5 = false;
bool containHeal6 = false;
bool containHeal7 = false;
Icon light = Icon(Icons.wb_sunny);
Icon dark = Icon(Icons.bedtime);
String itemId = "";

class _MyAppState extends State<MyApp> {
  List<FireBaseItem> getDataFromFireBase() {
    final List<FireBaseItem> fireBaseItem = [];
    return fireBaseItem;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
          child: Image.network(
            "https://www.mozzaik.shop/media/image/da/51/c2/DSC_0688.jpg",
          ),
        ),
        price: 2.0,
      ),
      UserItem(
        title: 'قهوة تركية',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Coffee2()));
          },
          child: Image.network(
            "https://feedo.shop/image/cache/catalog/Products%20Images/Soft-Drinks-Tea-Coffee/Tea-Coffee-Hot-Drinks/Coffee/Haseeb-Without-Cardamom-Coffee-200g-550x550.jpg",
          ),
        ),
        price: 1500,
      ),
      UserItem(
        title: 'قهوة تركية',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => coffee1()));
          },
          child: Image.network(
            "https://a.nooncdn.com/t_desktop-pdp-v1/v1532409190/N14456792A_1.jpg",
            scale: 6.5,
          ),
        ),
        price: 5.5,
      ),
      UserItem(
        title: 'قهوة تركية',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => coffee1()));
          },
          child: Image.network(
            "https://zamrad.shop/image/cache/catalog/product/coffee/4529685241-550x550.jpg",
          ),
        ),
        price: 310,
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
              key: _scaffoldKey,
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
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart_outlined),
                      title: Text('العربة'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => check_out()));
                      },
                    ),
                    ListTile(
                        leading: Icon(Icons.account_circle_outlined),
                        title: Text('حسابي'),
                        onTap: () async {
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.remove('phone');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => chose()));
                        }),
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
                  IconButton(
                      icon: Icon(Icons.shopping_bag),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => check_out()));
                      }),
                  IconButton(
                      icon: isDark ? dark : light,
                      onPressed: () {
                        setState(() {
                          isDark = !isDark;
                        });
                      })
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    //Image Slider
                    Container(
                        height: 200,
                        child: CarouselSlider(
                          carouselController: CarouselController(),
                          options: CarouselOptions(
                            autoPlay: true,
                            height: 250,
                            initialPage: 2,
                          ),
                          items: imgList
                              .map((item) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      child: Container(
                                        child: Center(
                                            child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(item,
                                              scale: 0.5, width: 1000),
                                        )),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )),

                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Text(
                        "منتجاتنا",
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            fontSize: 30),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
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
                                        side: BorderSide(
                                            color: Colors.brown, width: 4)),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      items[indexs].title,
                                                      style: GoogleFonts.cairo(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.green,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      "Turkish coffee",
                                                      style: GoogleFonts.cairo(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.green,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
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
                  child: Text("adam")),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("The Emergency meeting is dated secsfuly ☠☠"),
              ),
            ],
          )),
        );
      });
}
