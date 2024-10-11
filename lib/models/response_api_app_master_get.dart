import 'dart:convert';

ResponseApiAppMasterGet responseApiAppMasterGetFromJson(String str) =>
    ResponseApiAppMasterGet.fromJson(json.decode(str));

String responseApiAppMasterGetToJson(ResponseApiAppMasterGet data) =>
    json.encode(data.toJson());

class ResponseApiAppMasterGet {
  ResponseApiAppMasterGet({
    String? error,
    bool? success,
    List<Data>? data,
    num? count,
  }) {
    _error = error;
    _success = success;
    _data = data;
    _count = count;
  }

  ResponseApiAppMasterGet.fromJson(dynamic json) {
    _error = json['_error'];
    _success = json['_success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _count = json['count'];
  }

  String? _error;
  bool? _success;
  List<Data>? _data;
  num? _count;

  ResponseApiAppMasterGet copyWith({
    String? error,
    bool? success,
    List<Data>? data,
    num? count,
  }) =>
      ResponseApiAppMasterGet(
        error: error ?? _error,
        success: success ?? _success,
        data: data ?? _data,
        count: count ?? _count,
      );

  String? get error => _error;

  bool? get success => _success;

  List<Data>? get data => _data;

  num? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_error'] = _error;
    map['_success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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

  Data copyWith({
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
      Data(
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
