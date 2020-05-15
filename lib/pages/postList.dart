import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/pages/postCard.dart';
import 'package:microblog/services/PostServices.dart';
import 'package:microblog/services/UserServices.dart';
import 'package:http/http.dart' as http;



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
    String prevPage = arguments["prev"];
    String nextPage = arguments["next"];



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
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      onPressed: () async {

                        String postListJson = await UserServices.changePage(prevPage);
                        Map<String, dynamic> posts = json.decode(postListJson);
                        List<Post> postList = await PostServices.getPostsFormatted(posts);

                        String next = "";
                        String prev = "";


                        if(posts["_links"].containsKey("next"))
                          next = posts["_links"]["next"]["href"];


                        if(posts["_links"].containsKey("prev"))
                          prev = posts["_links"]["prev"]["href"];

                        Navigator.popAndPushNamed(
                            context,
                            "/posts",
                            arguments: {'postList': postList, 'next': next, 'prev': prev}
                        );
                      },
                      color: Color.fromRGBO(232, 90, 79, 1),
                      child: Text(
                        'Prev',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins'
                        ),
                      )),
                  SizedBox(width: 20,),
                  FlatButton(
                      onPressed: () async {

                        String postListJson = await UserServices.changePage(nextPage);
                        Map<String, dynamic> posts = json.decode(postListJson);
                        List<Post> postList = await PostServices.getPostsFormatted(posts);

                        String next = "";
                        String prev = "";


                        if(posts["_links"].containsKey("next"))
                          next = posts["_links"]["next"]["href"];


                        if(posts["_links"].containsKey("prev"))
                          prev = posts["_links"]["prev"]["href"];

                        Navigator.popAndPushNamed(
                            context,
                            "/posts",
                            arguments: {'postList': postList, 'next': next, 'prev': prev}
                        );
                      },
                      color: Color.fromRGBO(232, 90, 79, 1),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins'
                        ),
                      ))
                ],
              ),
              SizedBox(height: 40,)
            ],
          ),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            if(UserServices.u.roles == "ADMIN"){
              Navigator.popAndPushNamed(context, '/posts/newPost');
            }
          },
            backgroundColor: Color.fromRGBO(232, 90, 79, 1),
            child: Icon(Icons.add),
      ),
      );
    }
}