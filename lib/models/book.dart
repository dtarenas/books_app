class Book {
  var _id;
  var _name;
  var _author;
  var _pages;
  var _rating;
  var _isActionGenre;
  var _isAdventureGenre;
  var _isThrillerGenre;
  var _isComicGenre;
  var _urlPicture;

  Map<String, dynamic> toJson() => {
        'id': _id,
        'name': _name,
        'author': _author,
        'pages': _pages,
        'rating': _rating,
        'isActionGenre': _isActionGenre,
        'isAdventureGenre': _isAdventureGenre,
        'isFictionGenre': _isThrillerGenre,
        'isDramaGenre': _isComicGenre,
        'urlPicture': _urlPicture,
      };

  Book.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _author = json['author'],
        _pages = json['pages'],
        _rating = json['rating'],
        _isActionGenre = json['isActionGenre'],
        _isAdventureGenre = json['isAdventureGenre'],
        _isThrillerGenre = json['isThrillerGenre'],
        _isComicGenre = json['isComicGenre'],
        _urlPicture = json['urlPicture'];

  get id => _id;

  set id(value) {
    _id = value;
  }

  Book(
      this._id,
      this._name,
      this._author,
      this._pages,
      this._rating,
      this._isActionGenre,
      this._isAdventureGenre,
      this._isThrillerGenre,
      this._isComicGenre,
      this._urlPicture);

  get name => _name;

  set name(value) {
    _name = value;
  }

  get author => _author;

  set author(value) {
    _author = value;
  }

  get pages => _pages;

  set pages(value) {
    _pages = value;
  }

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }

  get isActionGenre => _isActionGenre;

  set isActionGenre(value) {
    _isActionGenre = value;
  }

  get isAdventureGenre => _isAdventureGenre;

  set isAdventureGenre(value) {
    _isAdventureGenre = value;
  }

  get isThrillerGenre => _isThrillerGenre;

  set isThrillerGenre(value) {
    _isThrillerGenre = value;
  }

  get isComicGenre => _isComicGenre;

  set isComicGenre(value) {
    _isComicGenre = value;
  }

  get urlPicture => _urlPicture;

  set urlPicture(value) {
    _urlPicture = value;
  }
}
