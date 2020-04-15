
import 'package:microblog/model/Comment.dart';
import 'package:microblog/model/Utente.dart';

class Post{

  int _Id;
  String _DataOra;
  String _Testo;
  String _Titolo;
  String _username;
  List<Comment> _commentList;


  Post(this._Id, this._DataOra, this._Testo, this._Titolo, this._username,
      this._commentList);


  List<Comment> get commentList => _commentList;

  set commentList(List<Comment> value) {
    _commentList = value;
  }

  String get Titolo => _Titolo;

  set Titolo(String value) {
    _Titolo = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get Testo => _Testo;

  set Testo(String value) {
    _Testo = value;
  }

  String get DataOra => _DataOra;

  set DataOra(String value) {
    _DataOra = value;
  }

  int get Id => _Id;

  set Id(int value) {
    _Id = value;
  }


}