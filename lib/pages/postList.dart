import 'package:flutter/material.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/pages/postCard.dart';


class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  List<Post> postList = [
    Post(1, 'Titolo', 'Testo'),
    Post(2, 'Title', 'Text'),
    Post(3, 'TITTOLO', 'TESTTTTO')
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromRGBO(234, 231, 220, 1),
        appBar: AppBar(
          title: Text(
            'CREATE A NEW POST',
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
          child:Row(
            children: <Widget>[
              Expanded(child: SizedBox(),
                flex: 1,),
              Expanded(
                flex: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: postList.map((post){
                    return postCard(post, context);
                  }).toList(),
                ),
              ),
              Expanded(child: SizedBox(),
                flex: 1,)
            ],
          ),
        )
    );
  }
}
