
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FailedConnection extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/internet_place_holder.png"),
          Text("No internet connection"),
          Text(
            "The quick, brown fox jumps over \n a lazy dog. DJs flock by",
            style: TextStyle(
              color: Colors.grey,

            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

}