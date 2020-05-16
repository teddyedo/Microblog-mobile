import 'package:flutter/material.dart';
import 'package:microblog/pages/createComment.dart';
import 'package:microblog/pages/createPost.dart';
import 'package:microblog/pages/home.dart';
import 'package:microblog/pages/login.dart';
import 'package:microblog/pages/logout.dart';
import 'package:microblog/pages/postList.dart';
import 'package:microblog/pages/preferences.dart';
import 'package:microblog/pages/registration.dart';
import 'package:microblog/pages/settings.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Settings(),
    '/home': (context) => Home(),
    '/home/registration': (context) => Registration(),
    '/home/preferences': (context) => Preferences(),
    '/home/login': (context) => Login(),
    '/home/logout': (context) => Logout(),
    '/posts': (context) => PostList(),
    '/posts/newPost': (context) => CreatePost(),
    '/posts/newComment': (context) => CreateComment(),
  },

));

