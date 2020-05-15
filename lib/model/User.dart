/// User class
/// @version 1.0.0 - Allari Edoardo
class User {

  int _id;
  String _username;
  String _password;
  String _email;
  String _roles;


  ///Constructor
  User();

  ///Getters and setters of user's roles
  String get roles => _roles;
  set roles(String value) {
    _roles = value;
  }

  ///Getters and setters of user's email
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  ///Getters and setters of user's password
  String get password => _password;
  set password(String value) {
    _password = value;
  }

  ///Getters and setters of user's username
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  ///Getters and setters of user's ID
  int get id => _id;
  set id(int value) {
    _id = value;
  }


  Map<String, dynamic> toJson(){

    return
      {
        'id': _id,
        'username': _username,
        'password': _password,
        'roles': _roles,
        'email': _email
      };

  }


}