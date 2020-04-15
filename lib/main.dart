import 'package:flutter/material.dart';
import 'package:microblog/pages/createComment.dart';
import 'package:microblog/pages/createPost.dart';
import 'package:microblog/pages/error.dart';
import 'package:microblog/pages/home.dart';
import 'package:microblog/pages/login.dart';
import 'package:microblog/pages/logout.dart';
import 'package:microblog/pages/notPermitted.dart';
import 'package:microblog/pages/postList.dart';
import 'package:microblog/pages/registration.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/home/registration': (context) => Registration(),
    '/home/login': (context) => Login(),
    '/home/logout': (context) => Logout(),
    '/posts': (context) => PostList(),
    '/posts/newpost': (context) => CreatePost(),
    '/posts/newcomment': (context) => CreateComment(),
  },

));

