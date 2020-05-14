import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:microblog/model/User.dart';

class UserServices {

  static String ip;
  static String port;
  static String protocol;
  static String token;
  static String user;
  static String pageSize = "5";

  static Utf8Codec utf8codec = new Utf8Codec();


  //Get the JWT for future requests
  static Future<String> getToken(String username, String password)async{

    Map<String, String> body = new Map();
    body["username"] = username;
    body["password"] = password;

    user = username;
    var bodyJson = json.encode(body);

    http.Response response = await http.post("$protocol://$ip:$port/Microblog/api/login",
        headers: {"Content-Type": "application/json"},
        body: bodyJson
    );
    if (response.headers.containsKey("authorization")){
      token = response.headers["authorization"];
    }
  }

  //return the list of the users
  static Future<String> getUsers() async{
    http.Response response = await http.get('$protocol://$ip:$port/Microblog/api/users');
    String body = utf8codec.decode(response.bodyBytes);
    return body;
  }


  //return the list of the posts
  static Future<String> getPosts() async{
     http.Response response = await http.get('$protocol://$ip:$port/Microblog/api/posts?size=$pageSize');
     String body = utf8codec.decode(response.bodyBytes);
     return body;
  }

  //return the post with the given id
  static Future<String> getPost(int id) async{
    http.Response response = await http.get('$protocol://$ip:$port/Microblog/api/posts/${id.toString()}');
    String body = utf8codec.decode(response.bodyBytes);
    return body;
  }

  //return the list of the comments
  static Future<String> getComments() async{
    http.Response response = await http.get('$protocol://$ip:$port/Microblog/api/comments');
    String body = utf8codec.decode(response.bodyBytes);
    return body;
  }


  //return the comment with the given id
  static Future<String> getComment(String id) async{
    http.Response response = await http.get('$protocol://$ip:$port/Microblog/api/comments');
    String body = utf8codec.decode(response.bodyBytes);
    return body;
  }
  
  //Create a post
  static void createPost(Map postMap) async{

    var body = json.encode(postMap);

    http.Response response = await http.post('$protocol://$ip:$port/Microblog/api/posts',
        headers: {"Content-Type": "application/json",
                  "authorization": token},
        body: body
    );
  }

  //Create a comment
  static void createComment(Map commentMap) async{
    var body = json.encode(commentMap);

    http.Response response = await http.post('$protocol://$ip:$port/Microblog/api/comments',
        headers: {"Content-Type": "application/json",
                  "authorization": token},
        body: body
    );
  }

  //create a new user
  static void createUser(Map userMap) async{
    var body = json.encode(userMap);
    
    http.Response response = await http.post('$protocol://$ip:$port/Microblog/api/users',
        headers: {"Content-Type": "application/json"},
        body: body
    );
  }

  //delete the post with the given id
  static void deletePost(String id) async{
    http.Response response = await http.delete('$protocol://$ip:$port/Microblog/api/posts/$id',
        headers: {"authorization": token}
    );
  }

  //return the user
  static Future<User> getUser(String url) async {

    http.Response response = await http.get(url);
    String body = utf8codec.decode(response.bodyBytes);

    Map<String, dynamic> userMap = json.decode(body);

    User u = new User();

    u.username = userMap["username"];
    u.password = userMap["password"];
    u.email = userMap["email"];
    u.roles = userMap["roles"];

    return u;
  }

  //return the list of the comments of the post with the given id
  static Future<List> getCommentsByPostId(String id) async{
    http.Response response = await http.get("$protocol://$ip:$port/Microblog/api/comments/search/findCommentsByPost_Id?id=$id");
    String body = utf8codec.decode(response.bodyBytes);

    Map<String, dynamic> commentsMap = json.decode(body);
    return commentsMap["_embedded"]["comments"];
  }


  static Future<String> changePage(String url) async{
    http.Response response = await http.get(url);
    String body = utf8codec.decode(response.bodyBytes);
    return body;
  }

}