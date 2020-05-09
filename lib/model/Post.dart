
import 'package:microblog/model/Comment.dart';

///Post class
///@version 1.0.0 - Allari Edoardo
class Post{

  int _id;
  String _dataOra;
  String _text;
  String _title;
  String _username;
  List<Comment> _commentList;


  ///Constructor
  Post(this._id, this._dataOra, this._text, this._title, this._username,
      this._commentList);

  ///getters and setters for comments list
  List<Comment> get commentList => _commentList;
  set commentList(List<Comment> value) {
    _commentList = value;
  }

  ///getters and setters for post's title
  String get Titolo => _title;
  set Titolo(String value) {
    _title = value;
  }

  ///getters and setters for post's creator
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  ///getters and setters for post's text
  String get Testo => _text;
  set Testo(String value) {
    _text = value;
  }

  ///getters and setters for post's date
  String get DataOra => _dataOra;
  set DataOra(String value) {
    _dataOra = value;
  }

  ///getters and setters for post's id
  int get Id => _id;
  set Id(int value) {
    _id = value;
  }

}