// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorite Screen'),
    );
  }
}
