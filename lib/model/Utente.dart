
class Utente {

  int _Id;
  String _Username;
  String _Password;
  String _Email;
  String _SALT;
  String _Roles;

  Utente(this._Id, this._Username, this._Password, this._Email, this._SALT,
      this._Roles);

  String get Roles => _Roles;

  set Roles(String value) {
    _Roles = value;
  }

  String get SALT => _SALT;

  set SALT(String value) {
    _SALT = value;
  }

  String get Email => _Email;

  set Email(String value) {
    _Email = value;
  }

  String get Password => _Password;

  set Password(String value) {
    _Password = value;
  }

  String get Username => _Username;

  set Username(String value) {
    _Username = value;
  }

  int get Id => _Id;

  set Id(int value) {
    _Id = value;
  }


}