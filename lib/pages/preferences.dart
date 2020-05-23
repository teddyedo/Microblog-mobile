import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/services/PostServices.dart';
import 'package:microblog/services/UserServices.dart';
import 'package:microblog/shared/Loading.dart';

///@version 1.0.0 - Allari Edoardo

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  final _settingsFormKey = GlobalKey<FormState>();
  TextEditingController pageController = new TextEditingController();

  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Color.fromRGBO(234, 231, 220, 1),
            appBar: AppBar(
              title: Text(
                'PREFERENCES',
                style: TextStyle(
                    color: Color.fromRGBO(232, 90, 79, 1),
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color.fromRGBO(217, 180, 126, 1),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                    flex: 3,
                  ),
                  Expanded(
                    flex: 14,
                    child: Form(
                      key: _settingsFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 150,
                          ),
                          Text(
                            'POSTS FOR PAGE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(232, 90, 79, 1),
                                fontFamily: 'Roboto',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2)
                            ],
                            keyboardType: TextInputType.number,
                            controller: pageController,
                            decoration: InputDecoration(
                                hintText: 'Number of posts for page',
                                focusedBorder: new UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color:
                                            Color.fromRGBO(232, 90, 79, 1)))),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter the number of the posts';
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(120, 119, 119, 1),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          FloatingActionButton.extended(
                            elevation: 0,
                            onPressed: () async {
                              if (_settingsFormKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });

                                UserServices.pageSize = pageController.text;

                                String postListJson =
                                    await UserServices.getPosts();
                                Map<String, dynamic> posts =
                                    json.decode(postListJson);

                                String nextPage = "";
                                String prevPage = "";

                                if (posts["_links"].containsKey("next"))
                                  nextPage = posts["_links"]["next"]["href"];

                                if (posts["_links"].containsKey("prev"))
                                  prevPage = posts["_links"]["prev"]["href"];

                                List<Post> postList =
                                    await PostServices.getPostsFormatted(posts);
                                Navigator.pushNamed(context, '/posts',
                                    arguments: {
                                      'postList': postList,
                                      'next': nextPage,
                                      'prev': prevPage
                                    });
                              }

                              setState(() {
                                loading = false;
                              });
                            },
                            backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                            label: Text(
                              'ENTER',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                fontSize: 20,
                              ),
                            ),
                            heroTag: 'loginbtn',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: 3,
                  )
                ],
              ),
            ));
  }
}
