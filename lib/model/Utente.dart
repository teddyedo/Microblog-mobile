
class Utente {

  int _id;
  String _username;
  String _password;
  String _email;
  String _salt;
  String _roles;


  Utente();

  String get roles => _roles;

  set roles(String value) {
    _roles = value;
  }

  String get salt => _salt;

  set salt(String value) {
    _salt = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }




}