
///Comment class
///@version 1.0.0 - Allari Edoardo
class Comment {

  int _id;
  String _text;
  String _dataOra;
  String _username;
  int _postId;

  ///Constructor
  Comment(this._id, this._text, this._dataOra, this._username,
      this._postId);

  ///Getters and setters of comment's ID
  int get postId => _postId;
  set postId(int value) {
    _postId = value;
  }

  ///Getters and setters of comment's creator
  String get username => _username;
  set username(String value) {
    _username = value;
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

  ///Getters and setters of post's ID
  int get Id => _id;
  set Id(int value) {
    _id = value;
  }

}

