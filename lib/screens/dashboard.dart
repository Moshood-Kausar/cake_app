import 'package:cake_app/screens/cart.dart';
import 'package:cake_app/screens/favourite.dart';
import 'package:cake_app/screens/homepage.dart';
import 'package:cake_app/screens/profile.dart';
import 'package:flutter/material.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  

  int _currentIndex = 0;
 
  final List<Widget> _widget = [
     const Home(),
     Favorite(),
    const Cart(),
     Profile(),
  ];
   final List<IconData> _icons = [
    Icons.home_filled,
    Icons.favorite_sharp,
    Icons.shopping_cart,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max, 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () { 
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          _currentIndex == index ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      _icons[index],
                      size: 26,
                      color:
                          _currentIndex == index ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
     
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: onTapped,
      //   iconSize: 20,
      //   selectedItemColor: Colors.black,

      //   unselectedItemColor: Colors.grey,
      //   selectedLabelStyle: const TextStyle(fontSize: 16),
      //   unselectedLabelStyle: const TextStyle(color: Colors.grey),
      //   type: BottomNavigationBarType.fixed,
      //   // ignore: prefer_const_literals_to_create_immutables
      //   items: [
      //     const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home  "),
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite), label: " Favorite "),
      //     const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: " Cart "),
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.person), label: "Profile  "),
      //   ],
      // ),
      body: _widget[_currentIndex],
    );
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
