
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microblog/model/Post.dart';
import 'package:microblog/services/UserServices.dart';


Widget postCard(post, context){

  List listaCommenti = post.commentList;

  return Card(
    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 6, 0),
                child: Text(
                  '${post.Titolo}',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(232, 90, 79, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 6, 0),
              child: Text(
                '${post.user.username}',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(120, 119, 119, 1),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 6, 0),
              child: Text(
                '${post.DataOra}',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: Color.fromRGBO(120, 119, 119, 1),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 6, 15),
                  child: Text(
                    '${post.Testo}',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Color.fromRGBO(120, 119, 119, 1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 6, 0),
              child: Text(
                'COMMENTS',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(120, 119, 119, 1),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: Row(
                children: <Widget>[
                  Expanded(child: SizedBox(),
                    flex: 1,),
                  Expanded(
                    flex: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listaCommenti.map((commento) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                            ),
                            Text(
                              '${commento.Testo}' + ' - ' + '${commento.user.username}',
                              style: TextStyle(
                                color: Color.fromRGBO(120, 119, 119, 1),
                                fontFamily: 'Roboto',
                                fontSize: 14
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(child: SizedBox(),
                    flex: 1,)
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(6,0,6,6),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {
                      if(UserServices.u.roles == "ADMIN" || UserServices.u.roles == "USER"){
                        Navigator.pushNamed(context, '/posts/newComment', arguments: {'postId': post.Id});
                      }
                    },
                    color: Color.fromRGBO(232, 90, 79, 1),
                    child: Text(
                      'COMMENT',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: 35,
                        color: Color.fromRGBO(232, 90, 79, 1),
                      ),
                      onPressed:() async {

                        UserServices.deletePost(post.Id.toString());
                        String postList = await UserServices.getPosts();
                        String commentList = await UserServices.getComments();
                        Navigator.popAndPushNamed(context, "/posts",
                            arguments: {'postList': postList, 'commentList': commentList});
                      })
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}