import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/services/PostServices.dart';
import 'package:microblog/services/UserServices.dart';
import 'package:microblog/shared/Loading.dart';

class CreateComment extends StatefulWidget {
  @override
  _CreateCommentState createState() => _CreateCommentState();
}

class _CreateCommentState extends State<CreateComment> {

  final _commentFormKey = GlobalKey<FormState>();
   TextEditingController textController = new TextEditingController();
   bool loading = false;

   @override
  Widget build(BuildContext context) {

     Map arguments = ModalRoute
         .of(context)
         .settings
         .arguments;

     return loading ? Loading() : Scaffold(
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
                      SizedBox(height: 10),
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
                            setState(() {
                              loading = true;
                            });
                            String text = textController.text;
                            String postId = arguments["postId"].toString();
                            String now = new DateTime.now().toString();

                            Map commentMap = new Map();

                            commentMap["user"] = "${UserServices.protocol}://"
                                "${UserServices.ip}:${UserServices.port}/Microblog"
                                "/api/users/${UserServices.u.id}";

                            commentMap["post"] = "${UserServices.protocol}://"
                                "${UserServices.ip}:${UserServices.port}/Microblog"
                                "/api/posts/$postId";
                            commentMap["dataOra"] = DateTime.parse(now.substring(0, now.length - 7)).toIso8601String();
                            commentMap["testo"] = text;

                            await UserServices.createComment(commentMap);

                            String postListJson = await UserServices.getPosts();
                            Map<String, dynamic> posts = json.decode(postListJson);

                            String nextPage = "";
                            String prevPage = "";


                            if(posts["_links"].containsKey("next"))
                              nextPage = posts["_links"]["next"]["href"];


                            if(posts["_links"].containsKey("prev"))
                              prevPage = posts["_links"]["prev"]["href"];

                            List<Post> postList = await PostServices.getPostsFormatted(posts);

                            Navigator.popAndPushNamed(
                                context,
                                '/posts',
                                arguments: {'postList': postList, 'next': nextPage, 'prev': prevPage}
                            );
                            setState(() {
                              loading = false;
                            });
                          }


                        },
                        backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                        elevation: 0,
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
