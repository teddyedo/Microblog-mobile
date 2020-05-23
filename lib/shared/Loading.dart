import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///@version 1.0.0 - Allari Edoardo

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(234, 231, 220, 1),
      child: Center(
        child: SpinKitFoldingCube(
          color: Color.fromRGBO(232, 90, 79, 1),
          size: 50,
        ),
      ),
    );
  }
}
