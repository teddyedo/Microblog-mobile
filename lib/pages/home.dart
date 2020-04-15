import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microblog/services/UserServices.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 231, 220, 1),
      appBar: AppBar(
        title: Text(
          'MICROBLOG',
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
      body: Row(
        children: <Widget>[
          Expanded(child: SizedBox(),
          flex: 3,),
          Expanded(
            flex: 14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home/login');
                  },
                  backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                  label: Text(
                    'LOGIN',
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
                SizedBox(height: 20),
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home/registration');
                  },
                  backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                  label: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontSize: 20,
                    ),
                  ),
                  heroTag: 'registerbtn',
                ),
                SizedBox(height: 20),
                FloatingActionButton.extended(
                  onPressed: () async {
                    String postList = await UserServices.getPosts();
                    String commentList = await UserServices.getComments();
                    Navigator.pushNamed(
                        context,
                        '/posts',
                        arguments: {postList: postList, commentList: commentList}
                    );
                  },
                  backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                  label: Text(
                    'SEE POSTS',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: 20,
                    ),
                  ),
                  heroTag: 'postsbtn',
                ),
                SizedBox(height: 20),
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home/logout');
                  },
                  backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                  label: Text(
                    'LOGOUT',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: 20,
                    ),
                  ),
                  heroTag: 'logoutbtn',
                )
              ],
            ),
          ),
          Expanded(child: SizedBox(),
          flex: 3,)
        ],
      )
    );
  }
}
