import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget postCard(post){
  return Card(
    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(height: 5,),
            Padding(
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
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(height: 10),
            Padding(
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(6,0,6,6),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {},
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
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(6,0,10,6),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {},
                    color: Color.fromRGBO(232, 90, 79, 1),
                    child: Text(
                      'VIEW COMMENTS',
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
            )
          ],
        )
      ],
    ),
  );
}