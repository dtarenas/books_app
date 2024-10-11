import 'dart:convert';

RequestNewBookAppMaster requestNewBookAppMasterFromJson(String str) => RequestNewBookAppMaster.fromJson(json.decode(str));
String requestNewBookAppMasterToJson(RequestNewBookAppMaster data) => json.encode(data.toJson());
class RequestNewBookAppMaster {
  RequestNewBookAppMaster({
      Book? book,}){
    _book = book;
}

  RequestNewBookAppMaster.fromJson(dynamic json) {
    _book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }
  Book? _book;
RequestNewBookAppMaster copyWith({  Book? book,
}) => RequestNewBookAppMaster(  book: book ?? _book,
);
  Book? get book => _book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
      String? name, 
      String? author, 
      num? pages, 
      num? rating, 
      num? id, 
      bool? isActionGenre, 
      bool? isAdventureGenre, 
      bool? isDramaGenre, 
      bool? isFantasyGenre, 
      bool? isFictionGenre, 
      bool? isRomanceGenre, 
      bool? isSuspenseGenre, 
      bool? isTerrorGenre, 
      String? urlPicture,}){
    _name = name;
    _author = author;
    _pages = pages;
    _rating = rating;
    _id = id;
    _isActionGenre = isActionGenre;
    _isAdventureGenre = isAdventureGenre;
    _isDramaGenre = isDramaGenre;
    _isFantasyGenre = isFantasyGenre;
    _isFictionGenre = isFictionGenre;
    _isRomanceGenre = isRomanceGenre;
    _isSuspenseGenre = isSuspenseGenre;
    _isTerrorGenre = isTerrorGenre;
    _urlPicture = urlPicture;
}

  Book.fromJson(dynamic json) {
    _name = json['name'];
    _author = json['author'];
    _pages = json['pages'];
    _rating = json['rating'];
    _id = json['id'];
    _isActionGenre = json['is_action_genre'];
    _isAdventureGenre = json['is_adventure_genre'];
    _isDramaGenre = json['is_drama_genre'];
    _isFantasyGenre = json['is_fantasy_genre'];
    _isFictionGenre = json['is_fiction_genre'];
    _isRomanceGenre = json['is_romance_genre'];
    _isSuspenseGenre = json['is_suspense_genre'];
    _isTerrorGenre = json['is_terror_genre'];
    _urlPicture = json['url_picture'];
  }
  String? _name;
  String? _author;
  num? _pages;
  num? _rating;
  num? _id;
  bool? _isActionGenre;
  bool? _isAdventureGenre;
  bool? _isDramaGenre;
  bool? _isFantasyGenre;
  bool? _isFictionGenre;
  bool? _isRomanceGenre;
  bool? _isSuspenseGenre;
  bool? _isTerrorGenre;
  String? _urlPicture;
Book copyWith({  String? name,
  String? author,
  num? pages,
  num? rating,
  num? id,
  bool? isActionGenre,
  bool? isAdventureGenre,
  bool? isDramaGenre,
  bool? isFantasyGenre,
  bool? isFictionGenre,
  bool? isRomanceGenre,
  bool? isSuspenseGenre,
  bool? isTerrorGenre,
  String? urlPicture,
}) => Book(  name: name ?? _name,
  author: author ?? _author,
  pages: pages ?? _pages,
  rating: rating ?? _rating,
  id: id ?? _id,
  isActionGenre: isActionGenre ?? _isActionGenre,
  isAdventureGenre: isAdventureGenre ?? _isAdventureGenre,
  isDramaGenre: isDramaGenre ?? _isDramaGenre,
  isFantasyGenre: isFantasyGenre ?? _isFantasyGenre,
  isFictionGenre: isFictionGenre ?? _isFictionGenre,
  isRomanceGenre: isRomanceGenre ?? _isRomanceGenre,
  isSuspenseGenre: isSuspenseGenre ?? _isSuspenseGenre,
  isTerrorGenre: isTerrorGenre ?? _isTerrorGenre,
  urlPicture: urlPicture ?? _urlPicture,
);
  String? get name => _name;
  String? get author => _author;
  num? get pages => _pages;
  num? get rating => _rating;
  num? get id => _id;
  bool? get isActionGenre => _isActionGenre;
  bool? get isAdventureGenre => _isAdventureGenre;
  bool? get isDramaGenre => _isDramaGenre;
  bool? get isFantasyGenre => _isFantasyGenre;
  bool? get isFictionGenre => _isFictionGenre;
  bool? get isRomanceGenre => _isRomanceGenre;
  bool? get isSuspenseGenre => _isSuspenseGenre;
  bool? get isTerrorGenre => _isTerrorGenre;
  String? get urlPicture => _urlPicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['author'] = _author;
    map['pages'] = _pages;
    map['rating'] = _rating;
    map['id'] = _id;
    map['is_action_genre'] = _isActionGenre;
    map['is_adventure_genre'] = _isAdventureGenre;
    map['is_drama_genre'] = _isDramaGenre;
    map['is_fantasy_genre'] = _isFantasyGenre;
    map['is_fiction_genre'] = _isFictionGenre;
    map['is_romance_genre'] = _isRomanceGenre;
    map['is_suspense_genre'] = _isSuspenseGenre;
    map['is_terror_genre'] = _isTerrorGenre;
    map['url_picture'] = _urlPicture;
    return map;
  }

}