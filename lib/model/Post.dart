
import 'package:microblog/model/Utente.dart';

class Post{

  int _Id;
  String _DataOra;
  String _Testo;
  String _Titolo;
  int _utenteID;

  Post(this._Id, this._DataOra, this._Testo, this._Titolo, this._utenteID);

  int get utenteID => _utenteID;

  set utenteID(int value) {
    _utenteID = value;
  }

  String get Titolo => _Titolo;

  set Titolo(String value) {
    _Titolo = value;
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