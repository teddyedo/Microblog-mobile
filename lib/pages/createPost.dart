import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:microblog/model/Utente.dart';
import 'package:microblog/services/UserServices.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final _postFormKey = GlobalKey<FormState>();
  TextEditingController titleController = new TextEditingController();
  TextEditingController textController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    JsonDecoder decoder = new JsonDecoder();
    JsonEncoder encoder = new JsonEncoder();

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromRGBO(234, 231, 220, 1),
        appBar: AppBar(
          title: Text(
            'CREATE A NEW POST',
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
        body: SingleChildScrollView(
          child:Row(
            children: <Widget>[
              Expanded(child: SizedBox(),
                flex: 3,),
              Expanded(
                flex: 14,
                child: Form(
                  key: _postFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 150),
                      Text(
                        'Title',
                        style: TextStyle(
                            color: Color.fromRGBO(232, 90, 79, 1),
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                            hintText: 'Enter the title',
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color.fromRGBO(232, 90, 79, 1)
                                )
                            )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the title of the post';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(120, 119, 119, 1),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Text',
                        style: TextStyle(
                            color: Color.fromRGBO(232, 90, 79, 1),
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: textController,
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                color: Color.fromRGBO(232, 90, 79, 1),
                            )
                            ),
                            hintText: 'Enter the text of the post',
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color.fromRGBO(232, 90, 79, 1)
                                )
                            )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the text';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(120, 119, 119, 1),
                        ),
                      ),
                      SizedBox(height: 100),
                      FloatingActionButton.extended(
                        onPressed: () async {
                          if (_postFormKey.currentState.validate()) {
                          }

                          String title = titleController.text;
                          String text = textController.text;

                          Map userMap = new Map();

                          userMap["password"] = "7b006e73c30bc000532df3dfc454007335ccfaebf433d68af2e0f3906fd49955";
                          userMap["id"] = 1;
                          userMap["username"] = "admin";
                          userMap["roles"] = "ADMIN";
                          userMap["salt"] = "mkLva5dGmwOmS9RqqpHfkw";
                          userMap["email"] = "admin.admin@admin.admin";

                          Map postMap = new Map();

                          postMap["utente"] = userMap;
                          postMap["dataOra"] = "2020-01-11T10:32:21.000+0000";
                          postMap["testo"] = '$title';
                          postMap["titolo"] = '$text';

                          await UserServices.createPost(postMap);
                          String postList = await UserServices.getPosts();
                          String commentList = await UserServices.getComments();
                          Navigator.popAndPushNamed(
                              context,
                              '/posts',
                              arguments: {'postList': postList, 'commentList': commentList}
                          );

                        },
                        backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                        label: Text(
                          'CREATE POST',
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
              ),
              Expanded(child: SizedBox(),
                flex: 3,)
            ],
          ),
        )
    );
  }
}
