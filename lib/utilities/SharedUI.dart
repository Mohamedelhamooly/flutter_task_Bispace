import 'package:flutter/material.dart';

TextField InputData({String name, bool scure}) {
  return TextField(
    obscureText: scure,
    decoration: InputDecoration(
      labelText: name,
//            labelStyle: TextStyle(color: mainOrangeColor),
    ),
  );
}

void showBottomNave(Widget input, BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0))),
          child: Container(
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0))),
              child: input),
        );
      });
}
