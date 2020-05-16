import 'package:flutter/material.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/services/PostServices.dart';
import 'dart:convert';
import 'package:microblog/services/UserServices.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final _postFormKey = GlobalKey<FormState>();

  ///Text fields controllers
  TextEditingController titleController = new TextEditingController();
  TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

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

                            String title = titleController.text;
                            String text = textController.text;

                            String now = new DateTime.now().toString();

                            Map<String, dynamic> postMap = new Map();

                            postMap["user"] = "${UserServices.protocol}://"
                                "${UserServices.ip}:${UserServices.port}/Microblog"
                                "/api/users/${UserServices.u.id}";
                            postMap["dataOra"] = DateTime.parse(now.substring(0, now.length - 7)).toIso8601String();
                            postMap["testo"] = '$text';
                            postMap["titolo"] = '$title';


                            await UserServices.createPost(postMap);

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
                          }
                        },
                        backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                        elevation: 0,
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
