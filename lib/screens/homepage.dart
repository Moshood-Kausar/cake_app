import 'package:cake_app/models/cakes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController();
  int currentSelect = 0;
  final List<String> _tabs = [
    'Popular',
    'ice cream',
    'Buttercake',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 50, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Let\'s, \n Eat Dessert Food ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/waffle.jpg"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: "Search...",
              isDense: true,
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(
                Icons.search,
                size: 25,
                color: Color(0xFFC98A81),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xfff5f5f5), width: 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xfff5f5f5)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Recommended",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
              Row(
                children: const [
                  Text(
                    'View All ',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFC98A81),
                    size: 14,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                  productItems.length,
                  (index) {
                    return Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 170,
                            width: 210,
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                                color: productItems[index].bcolor,
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                top: 80.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: List.generate(
                                        5,
                                        (index) => const Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      '${productItems[index].name}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${productItems[index].price}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.yellow,
                                        child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -110,
                          child: Container(
                            alignment: Alignment.center,
                            height: 200,
                            width: 250,
                            child: Image.asset(
                              '${productItems[index].img}',
                              width: 220,
                              height: 170,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                _tabs.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSelect = index;
                      _controller.jumpToPage(index);
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          _tabs[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFFC98A81),
                            fontWeight: currentSelect == index
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                      currentSelect == index
                          ? Container(
                              height: 1.5,
                              width: 55,
                              color: const Color(0xFFC98A81))
                          : const Center(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentSelect = index;
                });
              },
              children: [
                Center(
                  child: cakecard(
                    text: 'Waffle Sliced Banana',
                    price: "\$16",
                    img: "assets/waffle.jpg",
                  ),
                ),
                Center(
                  child: cakecard(
                    text: 'Waffle Sliced Banana',
                    price: "\$16",
                    img: "assets/stcake.png",
                  ),
                ),
                Center(
                  child: cakecard(
                    text: 'Waffle Sliced Banana',
                    price: "\$16",
                    img: "assets/ccake.png",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cakecard({
    String? img,
    String? price,
    String? text,
  }) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              backgroundImage: AssetImage('$img'),
              backgroundColor: Colors.white,
              radius: 40,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$text',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 16),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$price",
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 14)),
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.yellow,
                      child: Icon(Icons.favorite_border_outlined,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
