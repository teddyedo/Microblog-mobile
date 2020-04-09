
import 'package:microblog/model/Utente.dart';

class Post{

  int _Id;
  //DateTime _DataOra;
  String _Testo;
  String _Titolo;
  //Utente _utente;

  Post(this._Id, this._Titolo, this._Testo);

//  Utente get utente => _utente;
//
//  set utente(Utente value) {
//    _utente = value;
//  }

  String get Titolo => _Titolo;

  set Titolo(String value) {
    _Titolo = value;
  }

  String get Testo => _Testo;

  set Testo(String value) {
    _Testo = value;
  }

//  DateTime get DataOra => _DataOra;
//
//  set DataOra(DateTime value) {
//    _DataOra = value;
//  }

  int get Id => _Id;

  set Id(int value) {
    _Id = value;
  }


}