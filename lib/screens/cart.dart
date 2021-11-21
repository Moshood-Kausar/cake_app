import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _item = 1;
 late int price;
  

  @override
  void initState() {
    super.initState();
    price = 16;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/scake.png',
                height: 320,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
              ),
              const Text(
                "Red Velvet Desert",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                '"Butter Cake red velvet coated \n  with light cream cheese with red velvet\n crumble"',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Quantity',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFC98A81), width: 0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_item == 1) {
                                    _item = 1;
                                  } else {
                                    _item -= 1;
                                    price -= price;
                                  }
                                });
                              },
                              child: count('-')),
                          Text('$_item',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _item += 1;
                                price += price;
                              });
                            },
                            child: count('+'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Text('Detail Price',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFC98A81),
                    width: 1.8,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      priceDetails(detail: 'Price', prz: '\$$price'),
                      priceDetails(detail: 'Shipping fee', prz: '\$2'),
                      priceDetails(detail: 'Total Price', prz: '\$$price'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              MaterialButton(
                onPressed: () {},
                elevation: 0,
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color(0xFFC98A81),
                child: const Text(
                  'Order Now',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget count(String txt) {
    return Text(
      txt,
      style: const TextStyle(fontSize: 15, color: Colors.grey),
    );
  }

  Widget priceDetails({String? detail, prz}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$detail',
            style: const TextStyle(
              color: Color(0xFFC98A81),
            ),
          ),
          Text(
            '$prz',
            style: const TextStyle(
              color: Color(0xFFC98A81),
            ),
          ),
        ],
      ),
    );
  }
}
