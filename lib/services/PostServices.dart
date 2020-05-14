


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:microblog/model/Comment.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/model/User.dart';

import 'UserServices.dart';

class PostServices{

  static Future<List<Post>> getPostsFormatted(Map<String, dynamic> postMap) async{
    Map posts = postMap;
    List<Post> listPost = new List();
    for (int i = 0; i < posts["_embedded"]["posts"].length; i ++) {

      Post p = new Post();

      User user = await UserServices.getUser(posts["_embedded"]["posts"][i]["_links"]["user"]["href"]);

      String userUrl = posts["_embedded"]["posts"][i]["_links"]["self"]["href"];
      List<String> urlSplitted = userUrl.split("/");
      int id = int.parse(urlSplitted[urlSplitted.length - 1]);

      String text = posts["_embedded"]["posts"][i]["testo"];
      String title = posts["_embedded"]["posts"][i]["titolo"];
      String dataOra = posts["_embedded"]["posts"][i]["dataOra"];

      List<Comment> commentsList = new List();

      List commentsOfThisPost = await UserServices.getCommentsByPostId(id.toString());

      for (int j = 0; j < commentsOfThisPost.length; j ++){

        Comment c = new Comment();

        String dataOra = commentsOfThisPost[j]["dataOra"];
        String text = commentsOfThisPost[j]["testo"];
        User user = await UserServices.getUser(commentsOfThisPost[j]["_links"]["user"]["href"]);

        c.post = p;
        c.user = user;
        c.DataOra = dataOra;
        c.Testo = text;

        commentsList.add(c);
      }

      p.Id = id;
      p.Testo = text;
      p.DataOra = dataOra;
      p.user = user;
      p.Titolo = title;
      p.commentList = commentsList;

      listPost.add(p);
    }

    return listPost;
  }
}

