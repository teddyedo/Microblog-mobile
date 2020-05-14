
import 'Post.dart';
import 'User.dart';

///Comment class
///@version 1.0.0 - Allari Edoardo
class Comment {

  int _id;
  String _text;
  String _dataOra;
  User _user;
  Post _post;

  ///Constructor
  Comment();


  ///Getters and setters of the post
  Post get post => _post;
  set post(Post value) {
    _post = value;
  }

  ///Getters and setters of comment's creator
  User get user => _user;
  set user(User value) {
    _user = value;
  }

  ///Getters and setters of comment's data
  String get DataOra => _dataOra;
  set DataOra(String value) {
    _dataOra = value;
  }

  ///Getters and setters of comment's text
  String get Testo => _text;
  set Testo(String value) {
    _text = value;
  }

  ///Getters and setters of comment's ID
  int get Id => _id;
  set Id(int value) {
    _id = value;
  }

}

