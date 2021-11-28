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
   final List<String> _label = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
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
            child: FittedBox(
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
                          horizontal: 20, vertical: 8),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ?  Color(0xFFF9DCD7)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            _icons[index],
                            size: 18,
                            color: _currentIndex == index
                                ?  Color(0xFFC98A81)
                                :  Color(0xFFC98A81),
                          ),
                          const SizedBox(width: 4),
                          _currentIndex == index
                              ? Text(_label[index],
                                  style: const TextStyle(color:  Color(0xFFC98A81), fontSize:12))
                              : const Center(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: _widget[_currentIndex],
    );
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
