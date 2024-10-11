import 'dart:convert';

ResponseApiAppMasterPost responseApiAppMasterPostFromJson(String str) =>
    ResponseApiAppMasterPost.fromJson(json.decode(str));

String responseApiAppMasterPostToJson(ResponseApiAppMasterPost data) =>
    json.encode(data.toJson());

class ResponseApiAppMasterPost {
  ResponseApiAppMasterPost({
    String? error,
    bool? success,
    Book? book,
  }) {
    _error = error;
    _success = success;
    _book = book;
  }

  ResponseApiAppMasterPost.fromJson(dynamic json) {
    _error = json['_error'];
    _success = json['_success'];
    _book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }

  String? _error;
  bool? _success;
  Book? _book;

  ResponseApiAppMasterPost copyWith({
    String? error,
    bool? success,
    Book? book,
  }) =>
      ResponseApiAppMasterPost(
        error: error ?? _error,
        success: success ?? _success,
        book: book ?? _book,
      );

  String? get error => _error;

  bool? get success => _success;

  Book? get book => _book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_error'] = _error;
    map['_success'] = _success;
    if (_book != null) {
      map['book'] = _book?.toJson();
    }
    return map;
  }
}

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    num? id,
    String? createdAt,
    String? updatedAt,
    String? name,
    String? author,
    num? pages,
    bool? isActionGenre,
    bool? isAdventureGenre,
    bool? isDramaGenre,
    bool? isFantasyGenre,
    bool? isFictionGenre,
    bool? isRomanceGenre,
    bool? isSuspenseGenre,
    bool? isTerrorGenre,
    String? urlPicture,
    num? rating,
  }) {
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _name = name;
    _author = author;
    _pages = pages;
    _isActionGenre = isActionGenre;
    _isAdventureGenre = isAdventureGenre;
    _isDramaGenre = isDramaGenre;
    _isFantasyGenre = isFantasyGenre;
    _isFictionGenre = isFictionGenre;
    _isRomanceGenre = isRomanceGenre;
    _isSuspenseGenre = isSuspenseGenre;
    _isTerrorGenre = isTerrorGenre;
    _urlPicture = urlPicture;
    _rating = rating;
  }

  Book.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _name = json['name'];
    _author = json['author'];
    _pages = json['pages'];
    _isActionGenre = json['is_action_genre'];
    _isAdventureGenre = json['is_adventure_genre'];
    _isDramaGenre = json['is_drama_genre'];
    _isFantasyGenre = json['is_fantasy_genre'];
    _isFictionGenre = json['is_fiction_genre'];
    _isRomanceGenre = json['is_romance_genre'];
    _isSuspenseGenre = json['is_suspense_genre'];
    _isTerrorGenre = json['is_terror_genre'];
    _urlPicture = json['url_picture'];
    _rating = json['rating'];
  }

  num? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _name;
  String? _author;
  num? _pages;
  bool? _isActionGenre;
  bool? _isAdventureGenre;
  bool? _isDramaGenre;
  bool? _isFantasyGenre;
  bool? _isFictionGenre;
  bool? _isRomanceGenre;
  bool? _isSuspenseGenre;
  bool? _isTerrorGenre;
  String? _urlPicture;
  num? _rating;

  Book copyWith({
    num? id,
    String? createdAt,
    String? updatedAt,
    String? name,
    String? author,
    num? pages,
    bool? isActionGenre,
    bool? isAdventureGenre,
    bool? isDramaGenre,
    bool? isFantasyGenre,
    bool? isFictionGenre,
    bool? isRomanceGenre,
    bool? isSuspenseGenre,
    bool? isTerrorGenre,
    String? urlPicture,
    num? rating,
  }) =>
      Book(
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        name: name ?? _name,
        author: author ?? _author,
        pages: pages ?? _pages,
        isActionGenre: isActionGenre ?? _isActionGenre,
        isAdventureGenre: isAdventureGenre ?? _isAdventureGenre,
        isDramaGenre: isDramaGenre ?? _isDramaGenre,
        isFantasyGenre: isFantasyGenre ?? _isFantasyGenre,
        isFictionGenre: isFictionGenre ?? _isFictionGenre,
        isRomanceGenre: isRomanceGenre ?? _isRomanceGenre,
        isSuspenseGenre: isSuspenseGenre ?? _isSuspenseGenre,
        isTerrorGenre: isTerrorGenre ?? _isTerrorGenre,
        urlPicture: urlPicture ?? _urlPicture,
        rating: rating ?? _rating,
      );

  num? get id => _id;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get name => _name;

  String? get author => _author;

  num? get pages => _pages;

  bool? get isActionGenre => _isActionGenre;

  bool? get isAdventureGenre => _isAdventureGenre;

  bool? get isDramaGenre => _isDramaGenre;

  bool? get isFantasyGenre => _isFantasyGenre;

  bool? get isFictionGenre => _isFictionGenre;

  bool? get isRomanceGenre => _isRomanceGenre;

  bool? get isSuspenseGenre => _isSuspenseGenre;

  bool? get isTerrorGenre => _isTerrorGenre;

  String? get urlPicture => _urlPicture;

  num? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['name'] = _name;
    map['author'] = _author;
    map['pages'] = _pages;
    map['is_action_genre'] = _isActionGenre;
    map['is_adventure_genre'] = _isAdventureGenre;
    map['is_drama_genre'] = _isDramaGenre;
    map['is_fantasy_genre'] = _isFantasyGenre;
    map['is_fiction_genre'] = _isFictionGenre;
    map['is_romance_genre'] = _isRomanceGenre;
    map['is_suspense_genre'] = _isSuspenseGenre;
    map['is_terror_genre'] = _isTerrorGenre;
    map['url_picture'] = _urlPicture;
    map['rating'] = _rating;
    return map;
  }
}
