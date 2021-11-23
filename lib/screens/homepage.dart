import 'package:cake_app/models/cakes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                  )
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
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
              overflow: Overflow.visible,
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 170,
                  width: 210,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color:productItems[index].bcolor,
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
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${productItems[index].price}",
                              style: const TextStyle(color: Colors.white),
                            ),
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
                ),
              ),
              Positioned(
                  top: -110,
                  child: Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 250,
                    child: Image.asset('${productItems[index].img}',
                    width: 220,height:170,
                      fit: BoxFit.contain,
                    ),
                  )),
              ]);
                  },
                ),
              ),
            ),
               )
                        ],
          ),
        ),
      ),
    );
  }

 
}
