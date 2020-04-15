import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserServices {

  //return the list of the posts
  static Future<String> getPosts() async{
     http.Response response = await http.get('http://192.168.1.13:8080/Microblog/api/posts');
     Utf8Codec utf8codec = new Utf8Codec();
     String body = utf8codec.decode(response.bodyBytes);
     return body;
  }

  //return the post with the given id
  static Future<String> getPost(String id) async{
    http.Response response = await http.get('http://192.168.1.13:8080/Microblog/api/posts/' + id);
    Utf8Codec utf8codec = new Utf8Codec();
    String body = utf8codec.decode(response.bodyBytes);
    return body;
  }

  //return the list of the comments
  static Future<String> getComments() async{
    http.Response response = await http.get('http://192.168.1.13:8080/Microblog/api/comments');
    Utf8Codec utf8codec = new Utf8Codec();
    String body = utf8codec.decode(response.bodyBytes);
    return body;
  }


  //return the comment with the given id
  static Future<String> getComment(String id) async{
    http.Response response = await http.get('http://192.168.1.13:8080/Microblog/api/comments');
    Utf8Codec utf8codec = new Utf8Codec();
    String body = utf8codec.decode(response.bodyBytes);
    return body;
  }

  //Create a post
  static void createPost(String id) async{
    http.Response response = await http.post('http://192.168.1.13:8080/Microblog/api/comments');
  }

  //Create a comment
  static void createComment(String id) async{
    http.Response response = await http.post('http://192.168.1.13:8080/Microblog/api/comments');
  }

}