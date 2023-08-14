import 'package:flutter/material.dart';

import 'homescreens.dart';

class MenuScreens extends StatelessWidget {
  final List<String> categories = [
    'Seasonal Product',
    'Best Seller',
    'Coffee',
  ];

  final List<Map<String, dynamic>> menuItems = [
    {
      'category': 'Coffee',
      'title': 'Coffee Arabica',
      'description': 'Your Coffee is My Coffee',
      'price': 20.000,
      'image': 'assets/images/arabica.jpeg',
    },
    // Add more menu items with their details here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () {
                      // Scroll to the category when tapped
                      // Implement your scroll logic here
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(menuItems[index]['image']),
                  title: Text(menuItems[index]['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(menuItems[index]['description']),
                      Text('\Rp${menuItems[index]['price']}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0)), // Ubah radius sesuai keinginan
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
