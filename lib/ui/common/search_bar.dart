import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final Function onChanged;
  final Function onSaved;
  final String initialValue;
  final String Function(String) validator;
  final TextInputType type;
  final String label;
  final Widget suffix;
  final TextEditingController controller;
  final bool suffixClose;
  final bool focused;
  final FocusNode focusNode;

  const SearchInput({
    Key key,
    this.onChanged,
    this.onSaved,
    this.initialValue = "",
    this.validator,
    this.type,
    this.label,
    this.suffix,
    this.controller,
    this.suffixClose = false,
    this.focused = false,
    this.focusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
        child: Stack(
          children: [
            TextFormField(
                initialValue: initialValue != null ? initialValue : "",
                onChanged: onChanged,
                validator: validator,
                onSaved: onSaved,
                keyboardType: type,
                focusNode: focusNode,
                decoration: InputDecoration(
                  suffix: suffix,
                  isDense: true,
                  hintText: label,
                  hintStyle: TextStyle(fontSize: w > 400 ? 16: 15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.pinkAccent, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent, width: 1.0),
                  ),
                )),
            focused ?
            Positioned(
                top: 0,bottom: 0,
                right: 50,
                child: Container(
                  width: 1.0,
                  // height: 40,
                  color: Colors.black,
                )) : Container()

          ],
        )
    );
  }
}
