import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:microblog/model/Comment.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/pages/postCard.dart';


class PostList extends StatefulWidget {

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {


  _PostListState();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    JsonDecoder decoder = new JsonDecoder();

    Map arguments = ModalRoute
        .of(context)
        .settings
        .arguments;

    //find Posts
    List postList = decoder.convert(arguments["postList"].toString());
    List<Post> listaPost = new List();
    for (int i = 0; i < postList.length; i ++) {
      String username = postList[i]["utente"]["username"];
      int Id = postList[i]["id"];
      String text = postList[i]["titolo"];
      String title = postList[i]["testo"];
      String dataOra = postList[i]["dataOra"];

      List<Comment> cList = new List();

      Post p = new Post(Id, dataOra, text, title, username, cList);
      listaPost.add(p);
    }
    //Find comments
    List commentList = decoder.convert(arguments["commentList"].toString());

    for (int i = 0; i < commentList.length; i ++) {
      String username = commentList[i]["utente"]["username"];
      int Id = commentList[i]["id"];
      String title = commentList[i]["testo"];
      String dataOra = commentList[i]["dataOra"];
      int postId = commentList[i]["post"]["id"];

      Comment c = new Comment(Id, title, dataOra, username, postId);

      for (Post p in listaPost){
        if (c.postId == p.Id){
          p.commentList.add(c);
        }
      }
    }
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
          body: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                Expanded(child: SizedBox(),
                  flex: 1,),
                Expanded(
                  flex: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: listaPost.map((post) {
                      return postCard(post, context);
                    }).toList(),
                  ),
                ),
                Expanded(child: SizedBox(),
                  flex: 1,
                ),
              ],
            ),
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