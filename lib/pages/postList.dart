import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/pages/postCard.dart';


class PostList extends StatefulWidget {

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  _PostListState();

  @override
  Widget build(BuildContext context) {
    JsonDecoder decoder = new JsonDecoder();

    Map arguments = ModalRoute
        .of(context)
        .settings
        .arguments;

    List<Post> listPost = arguments["postList"];

      return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color.fromRGBO(234, 231, 220, 1),
          appBar: AppBar(
            title: Text(
              'POSTS',
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
          body: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: SizedBox(),
                    flex: 1,),
                  Expanded(
                    flex: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listPost.map((post) {
                        return postCard(post, context);
                      }).toList(),
                    ),
                  ),
                  Expanded(child: SizedBox(),
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(height: 90,)
            ],
          ),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/posts/newpost');
          },
            backgroundColor: Color.fromRGBO(232, 90, 79, 1),
            child: Icon(Icons.add),
      ),
      );
    }
}