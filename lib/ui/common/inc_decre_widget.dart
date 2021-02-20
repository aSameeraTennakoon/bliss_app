import 'package:flutter/material.dart';
import 'package:bliss_flutter/global/theme.dart' as theme;

class IncrementDecrementWidget extends StatelessWidget {
  final Function onDecrement;
  final Function onIncrement;
  final String value;
  final String label;

  const IncrementDecrementWidget({
    Key key,
    this.onDecrement,
    this.onIncrement,
    @required this.value,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: [
        InkWell(
          onTap: onDecrement,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.remove, color: Colors.black),
          ),
        ),
        Container(
          width: 80,
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: theme.detailDStyle,
            // style: categoryChipText,
          ),
        ),
        InkWell(
          onTap: onIncrement,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.add, color: Colors.black),
          ),
        ),
      ]),
    );
  }
}
