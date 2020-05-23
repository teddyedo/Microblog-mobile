import 'package:microblog/model/Comment.dart';

import 'User.dart';

///Post class
///@version 1.0.0 - Allari Edoardo
class Post {
  int _id;
  String _dataOra;
  String _text;
  String _title;
  User _user;
  List<Comment> _commentList;

  ///Constructor
  Post();

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
  User get user => _user;

  set user(User value) {
    _user = value;
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

  Map<String, dynamic> toJson() {
    return {
      'dataOra': _dataOra,
      'testo': _text,
      'titolo': _title,
      'utente': _user
    };
  }
}
