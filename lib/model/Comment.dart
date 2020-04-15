
import 'Post.dart';
import 'Utente.dart';

class Comment {

  int _Id;
  String _Testo;
  String _Titolo;
  String _DataOra;
  String _username;
  int _postId;

  Comment(this._Id, this._Testo, this._Titolo, this._DataOra, this._username,
      this._postId);

  int get postId => _postId;

  set postId(int value) {
    _postId = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get DataOra => _DataOra;

  set DataOra(String value) {
    _DataOra = value;
  }

  String get Titolo => _Titolo;

  set Titolo(String value) {
    _Titolo = value;
  }

  String get Testo => _Testo;

  set Testo(String value) {
    _Testo = value;
  }

  int get Id => _Id;

  set Id(int value) {
    _Id = value;
  }


}

