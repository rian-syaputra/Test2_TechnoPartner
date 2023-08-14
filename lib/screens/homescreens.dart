import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'menuscreens.dart';

class HomeScreens extends StatefulWidget {
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  List<String> banners = [
    "assets/images/banner1.png",
    "assets/images/banner2.jpeg",
    "assets/images/banner3.png",
  ];
  int currentBannerIndex = 0;

  @override
  void initState() {
    super.initState();
    // Auto change banner every 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        currentBannerIndex = (currentBannerIndex + 1) % banners.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Transform.scale(
          scale: MediaQuery.of(context).size.width > 600 ? 2.5 : 2.0,
          child: Image.asset(
            'assets/images/logo technopartner.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Implement refresh logic here
        },
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                // Show QR Code popup
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Show the QR Code below to the cashier"),
                      content: Image.asset("assets/images/qr.png"),
                    );
                  },
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 245, 243, 243).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/motif.png"), // Set your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Good Afternoon,"),
                          Text("Johan Cruft"),
                        ],
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset("assets/images/qr.png",
                                width: 100, height: 100),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Saldo \Rp 100.000"),
                                Text("Points: 50.000"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
              ),
              items: banners.map((banner) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        banner,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0)),
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreens(),
                    ),
                  );
                },
                child: Image.asset('assets/images/home1.png',
                    width: 34, height: 34),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MenuScreens(),
                    ),
                  );
                },
                child: Image.asset('assets/images/menu1.png',
                    width: 34, height: 34),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
