import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microblog/services/UserServices.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  TextEditingController IpController = new TextEditingController();
  TextEditingController PortController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(234, 231, 220, 1),
        appBar: AppBar(
          title: Text(
            'SETTINGS',
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
                    'IP ',
                    style: TextStyle(
                        color: Color.fromRGBO(232, 90, 79, 1),
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: IpController,
                    decoration: InputDecoration(
                        hintText: 'Enter the IP of the server',
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(232, 90, 79, 1)
                            )
                        )
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the IP of the server';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(120, 119, 119, 1),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Port',
                    style: TextStyle(
                        color: Color.fromRGBO(232, 90, 79, 1),
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: PortController,
                    decoration: InputDecoration(
                        hintText: 'Enter the server port',
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(232, 90, 79, 1)
                            )
                        )
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please the port of the server';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(120, 119, 119, 1),
                    ),
                  ),
                  SizedBox(height: 60),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/home');
                      print(IpController.text);
                      print(PortController.text);
                      UserServices.IP = IpController.text;
                      UserServices.Port = PortController.text;
                      print(UserServices.Port);
                      print(UserServices.IP);
                    },
                    backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                    label: Text(
                      'ENTER',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 20,
                      ),
                    ),
                    heroTag: 'loginbtn',
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
