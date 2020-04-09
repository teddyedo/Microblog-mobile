import 'package:flutter/material.dart';

class NotPermitted extends StatefulWidget {
  @override
  _NotPermittedState createState() => _NotPermittedState();
}

class _NotPermittedState extends State<NotPermitted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(234, 231, 220, 1),
        appBar: AppBar(
          title: Text(
            'STAY OUT!',
            style: TextStyle(
                color: Color.fromRGBO(232, 90, 79, 1),
                fontSize: 25,
                fontFamily: 'Poppins',
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Color.fromRGBO(217, 180, 126, 1),
          centerTitle: true,
        ),
        body: Row(
          children: <Widget>[
            Expanded(child: SizedBox(),
              flex: 3,),
            Expanded(
              flex: 14,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'You don\'t have the permission to do that!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(120, 119, 119, 1),
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      height: 1.1
                    ),
                  ),
                  SizedBox(height: 50,),
                  FloatingActionButton.extended(
                    onPressed: () {},
                    backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                    label: Text(
                      'BACK TO HOME',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox(),
              flex: 3,)
          ],
        )
    );
  }
}
