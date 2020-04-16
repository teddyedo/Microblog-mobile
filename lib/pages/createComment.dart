import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:microblog/services/UserServices.dart';

class CreateComment extends StatefulWidget {
  @override
  _CreateCommentState createState() => _CreateCommentState();
}

class _CreateCommentState extends State<CreateComment> {

  final _commentFormKey = GlobalKey<FormState>();
  TextEditingController titleController = new TextEditingController();
  TextEditingController textController = new TextEditingController();

   @override
  Widget build(BuildContext context) {

     Map arguments = ModalRoute
         .of(context)
         .settings
         .arguments;

     return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromRGBO(234, 231, 220, 1),
        appBar: AppBar(
          title: Text(
            'CREATE A NEW COMMENT',
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
                  key: _commentFormKey,
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
                            return 'Please enter the title of the comment';
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
                            hintText: 'Enter the text of the comment',
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
                          if (_commentFormKey.currentState.validate()) {
                          }
                          String title = titleController.text;
                          String text = textController.text;
                          String postJson = await UserServices.getPost(arguments["postId"]);
                          Map postMap = jsonDecode(postJson);

                          Map userMap = new Map();

                          userMap["password"] = "Gervaso23";
                          userMap["id"] = 2;
                          userMap["username"] = "Edoardo23";
                          userMap["roles"] = "USER";
                          userMap["salt"] = "sdgesihgoghgigwh";
                          userMap["email"] = "egosho.ageg@gmail.com";

                          Map commentMap = new Map();
                          commentMap["utente"] = userMap;
                          commentMap["post"] = postMap;
                          commentMap["dataOra"] = "2020-12-04T10:32:21.000+0000";
                          commentMap["titolo"] = text;
                          commentMap["testo"] = title;

                          await UserServices.createComment(commentMap);
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
                          'COMMENT',
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
