import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/pages/postCard.dart';


class PostList extends StatefulWidget {


  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  _PostListState();

 @override
  Widget build(BuildContext context) {

   JsonDecoder decoder = new JsonDecoder();

   String data = ModalRoute.of(context).settings.arguments;
   List postList = decoder.convert(data.toString());
   List<Post> listaPost = new List();

   for (int i = 0; i < postList.length; i ++){

     int IdUtente = postList[i]["utente"]["id"];
     int Id = postList[i]["id"];
     String testo = postList[i]["titolo"];
     String titolo = postList[i]["testo"];
     String dataOra = postList[i]["dataOra"];


     Post p = new Post(Id, dataOra, testo, titolo, IdUtente);

     listaPost.add(p);
   }

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
                  children: listaPost.map((post){
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
