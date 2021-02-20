import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Image.asset('assets/images/logo.png'))
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
