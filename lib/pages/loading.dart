import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading>{

  void getData() async{

    Response response = await get('http://192.168.1.2:8080/Microblog/api/posts');
    List data = jsonDecode(response.body);
    print(data[1]['utente']['id']);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text('LOADING'),
    );
  }

}
