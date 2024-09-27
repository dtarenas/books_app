class User {
  var _name;
  var _email;
  var _uid;
  var _city;
  var _genre;
  var _isActionFavorite;
  var _isThrillerFavorite;
  var _isAdventureFavorite;
  var _isComicFavorite;
  var _bornDate;

  Map<String, dynamic> toJson() => {
        "name": _name,
        "email": _email,
        "uid": _uid,
        "city": _city,
        "genre": _genre,
        "isActionFavorite": _isActionFavorite,
        "isThrillerFavorite": _isThrillerFavorite,
        "isAdventureFavorite": _isAdventureFavorite,
        "isComicFavorite": _isComicFavorite,
        "bornDate": _bornDate,
      };

  User.Empty();

  User.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _uid = json['uid'];
    _city = json['city'];
    _genre = json['genre'];
    _isActionFavorite = json['isActionFavorite'];
    _isThrillerFavorite = json['isThrillerFavorite'];
    _isAdventureFavorite = json['isAdventureFavorite'];
    _isComicFavorite = json['isComicFavorite'];
    _bornDate = json['bornDate'];
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get email => _email;

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }

  get isComicFavorite => _isComicFavorite;

  set isComicFavorite(value) {
    _isComicFavorite = value;
  }

  get isAdventureFavorite => _isAdventureFavorite;

  set isAdventureFavorite(value) {
    _isAdventureFavorite = value;
  }

  get isThrillerFavorite => _isThrillerFavorite;

  set isThrillerFavorite(value) {
    _isThrillerFavorite = value;
  }

  get isActionFavorite => _isActionFavorite;

  set isActionFavorite(value) {
    _isActionFavorite = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get city => _city;

  set city(value) {
    _city = value;
  }

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }

  set email(value) {
    _email = value;
  }

  User(
      this._name,
      this._email,
      this._uid,
      this._city,
      this._genre,
      this._isActionFavorite,
      this._isThrillerFavorite,
      this._isAdventureFavorite,
      this._isComicFavorite,
      this._bornDate);
}
