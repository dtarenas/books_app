import 'dart:convert';

ResponseApiNyTimes ResponseApiNyTimesFromJson(String str) => ResponseApiNyTimes.fromJson(json.decode(str));

String ResponseApiNyTimesToJson(ResponseApiNyTimes data) => json.encode(data.toJson());

class ResponseApiNyTimes {
  ResponseApiNyTimes({
    String? status,
    String? copyright,
    num? numResults,
    Results? results,
  }) {
    _status = status;
    _copyright = copyright;
    _numResults = numResults;
    _results = results;
  }

  ResponseApiNyTimes.fromJson(dynamic json) {
    _status = json['status'];
    _copyright = json['copyright'];
    _numResults = json['num_results'];
    _results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  String? _status;
  String? _copyright;
  num? _numResults;
  Results? _results;

  ResponseApiNyTimes copyWith({
    String? status,
    String? copyright,
    num? numResults,
    Results? results,
  }) =>
      ResponseApiNyTimes(
        status: status ?? _status,
        copyright: copyright ?? _copyright,
        numResults: numResults ?? _numResults,
        results: results ?? _results,
      );

  String? get status => _status;

  String? get copyright => _copyright;

  num? get numResults => _numResults;

  Results? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['copyright'] = _copyright;
    map['num_results'] = _numResults;
    if (_results != null) {
      map['results'] = _results?.toJson();
    }
    return map;
  }
}

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));

String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
  Results({
    String? bestsellersDate,
    String? publishedDate,
    String? publishedDateDescription,
    String? previousPublishedDate,
    String? nextPublishedDate,
    List<Lists>? lists,
  }) {
    _bestsellersDate = bestsellersDate;
    _publishedDate = publishedDate;
    _publishedDateDescription = publishedDateDescription;
    _previousPublishedDate = previousPublishedDate;
    _nextPublishedDate = nextPublishedDate;
    _lists = lists;
  }

  Results.fromJson(dynamic json) {
    _bestsellersDate = json['bestsellers_date'];
    _publishedDate = json['published_date'];
    _publishedDateDescription = json['published_date_description'];
    _previousPublishedDate = json['previous_published_date'];
    _nextPublishedDate = json['next_published_date'];
    if (json['lists'] != null) {
      _lists = [];
      json['lists'].forEach((v) {
        _lists?.add(Lists.fromJson(v));
      });
    }
  }

  String? _bestsellersDate;
  String? _publishedDate;
  String? _publishedDateDescription;
  String? _previousPublishedDate;
  String? _nextPublishedDate;
  List<Lists>? _lists;

  Results copyWith({
    String? bestsellersDate,
    String? publishedDate,
    String? publishedDateDescription,
    String? previousPublishedDate,
    String? nextPublishedDate,
    List<Lists>? lists,
  }) =>
      Results(
        bestsellersDate: bestsellersDate ?? _bestsellersDate,
        publishedDate: publishedDate ?? _publishedDate,
        publishedDateDescription:
            publishedDateDescription ?? _publishedDateDescription,
        previousPublishedDate: previousPublishedDate ?? _previousPublishedDate,
        nextPublishedDate: nextPublishedDate ?? _nextPublishedDate,
        lists: lists ?? _lists,
      );

  String? get bestsellersDate => _bestsellersDate;

  String? get publishedDate => _publishedDate;

  String? get publishedDateDescription => _publishedDateDescription;

  String? get previousPublishedDate => _previousPublishedDate;

  String? get nextPublishedDate => _nextPublishedDate;

  List<Lists>? get lists => _lists;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bestsellers_date'] = _bestsellersDate;
    map['published_date'] = _publishedDate;
    map['published_date_description'] = _publishedDateDescription;
    map['previous_published_date'] = _previousPublishedDate;
    map['next_published_date'] = _nextPublishedDate;
    if (_lists != null) {
      map['lists'] = _lists?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Lists listsFromJson(String str) => Lists.fromJson(json.decode(str));

String listsToJson(Lists data) => json.encode(data.toJson());

class Lists {
  Lists({
    num? listId,
    String? listName,
    String? listNameEncoded,
    String? displayName,
    String? updated,
    dynamic listImage,
    dynamic listImageWidth,
    dynamic listImageHeight,
    List<Books>? books,
  }) {
    _listId = listId;
    _listName = listName;
    _listNameEncoded = listNameEncoded;
    _displayName = displayName;
    _updated = updated;
    _listImage = listImage;
    _listImageWidth = listImageWidth;
    _listImageHeight = listImageHeight;
    _books = books;
  }

  Lists.fromJson(dynamic json) {
    _listId = json['list_id'];
    _listName = json['list_name'];
    _listNameEncoded = json['list_name_encoded'];
    _displayName = json['display_name'];
    _updated = json['updated'];
    _listImage = json['list_image'];
    _listImageWidth = json['list_image_width'];
    _listImageHeight = json['list_image_height'];
    if (json['books'] != null) {
      _books = [];
      json['books'].forEach((v) {
        _books?.add(Books.fromJson(v));
      });
    }
  }

  num? _listId;
  String? _listName;
  String? _listNameEncoded;
  String? _displayName;
  String? _updated;
  dynamic _listImage;
  dynamic _listImageWidth;
  dynamic _listImageHeight;
  List<Books>? _books;

  Lists copyWith({
    num? listId,
    String? listName,
    String? listNameEncoded,
    String? displayName,
    String? updated,
    dynamic listImage,
    dynamic listImageWidth,
    dynamic listImageHeight,
    List<Books>? books,
  }) =>
      Lists(
        listId: listId ?? _listId,
        listName: listName ?? _listName,
        listNameEncoded: listNameEncoded ?? _listNameEncoded,
        displayName: displayName ?? _displayName,
        updated: updated ?? _updated,
        listImage: listImage ?? _listImage,
        listImageWidth: listImageWidth ?? _listImageWidth,
        listImageHeight: listImageHeight ?? _listImageHeight,
        books: books ?? _books,
      );

  num? get listId => _listId;

  String? get listName => _listName;

  String? get listNameEncoded => _listNameEncoded;

  String? get displayName => _displayName;

  String? get updated => _updated;

  dynamic get listImage => _listImage;

  dynamic get listImageWidth => _listImageWidth;

  dynamic get listImageHeight => _listImageHeight;

  List<Books>? get books => _books;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['list_id'] = _listId;
    map['list_name'] = _listName;
    map['list_name_encoded'] = _listNameEncoded;
    map['display_name'] = _displayName;
    map['updated'] = _updated;
    map['list_image'] = _listImage;
    map['list_image_width'] = _listImageWidth;
    map['list_image_height'] = _listImageHeight;
    if (_books != null) {
      map['books'] = _books?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  Books({
    String? ageGroup,
    String? amazonProductUrl,
    String? articleChapterLink,
    String? author,
    String? bookImage,
    num? bookImageWidth,
    num? bookImageHeight,
    String? bookReviewLink,
    String? bookUri,
    String? btrn,
    String? contributor,
    String? contributorNote,
    String? createdDate,
    String? description,
    String? firstChapterLink,
    String? price,
    String? primaryIsbn10,
    String? primaryIsbn13,
    String? publisher,
    num? rank,
    num? rankLastWeek,
    String? sundayReviewLink,
    String? title,
    String? updatedDate,
    num? weeksOnList,
    List<BuyLinks>? buyLinks,
  }) {
    _ageGroup = ageGroup;
    _amazonProductUrl = amazonProductUrl;
    _articleChapterLink = articleChapterLink;
    _author = author;
    _bookImage = bookImage;
    _bookImageWidth = bookImageWidth;
    _bookImageHeight = bookImageHeight;
    _bookReviewLink = bookReviewLink;
    _bookUri = bookUri;
    _btrn = btrn;
    _contributor = contributor;
    _contributorNote = contributorNote;
    _createdDate = createdDate;
    _description = description;
    _firstChapterLink = firstChapterLink;
    _price = price;
    _primaryIsbn10 = primaryIsbn10;
    _primaryIsbn13 = primaryIsbn13;
    _publisher = publisher;
    _rank = rank;
    _rankLastWeek = rankLastWeek;
    _sundayReviewLink = sundayReviewLink;
    _title = title;
    _updatedDate = updatedDate;
    _weeksOnList = weeksOnList;
    _buyLinks = buyLinks;
  }

  Books.fromJson(dynamic json) {
    _ageGroup = json['age_group'];
    _amazonProductUrl = json['amazon_product_url'];
    _articleChapterLink = json['article_chapter_link'];
    _author = json['author'];
    _bookImage = json['book_image'];
    _bookImageWidth = json['book_image_width'];
    _bookImageHeight = json['book_image_height'];
    _bookReviewLink = json['book_review_link'];
    _bookUri = json['book_uri'];
    _btrn = json['btrn'];
    _contributor = json['contributor'];
    _contributorNote = json['contributor_note'];
    _createdDate = json['created_date'];
    _description = json['description'];
    _firstChapterLink = json['first_chapter_link'];
    _price = json['price'];
    _primaryIsbn10 = json['primary_isbn10'];
    _primaryIsbn13 = json['primary_isbn13'];
    _publisher = json['publisher'];
    _rank = json['rank'];
    _rankLastWeek = json['rank_last_week'];
    _sundayReviewLink = json['sunday_review_link'];
    _title = json['title'];
    _updatedDate = json['updated_date'];
    _weeksOnList = json['weeks_on_list'];
    if (json['buy_links'] != null) {
      _buyLinks = [];
      json['buy_links'].forEach((v) {
        _buyLinks?.add(BuyLinks.fromJson(v));
      });
    }
  }

  String? _ageGroup;
  String? _amazonProductUrl;
  String? _articleChapterLink;
  String? _author;
  String? _bookImage;
  num? _bookImageWidth;
  num? _bookImageHeight;
  String? _bookReviewLink;
  String? _bookUri;
  String? _btrn;
  String? _contributor;
  String? _contributorNote;
  String? _createdDate;
  String? _description;
  String? _firstChapterLink;
  String? _price;
  String? _primaryIsbn10;
  String? _primaryIsbn13;
  String? _publisher;
  num? _rank;
  num? _rankLastWeek;
  String? _sundayReviewLink;
  String? _title;
  String? _updatedDate;
  num? _weeksOnList;
  List<BuyLinks>? _buyLinks;

  Books copyWith({
    String? ageGroup,
    String? amazonProductUrl,
    String? articleChapterLink,
    String? author,
    String? bookImage,
    num? bookImageWidth,
    num? bookImageHeight,
    String? bookReviewLink,
    String? bookUri,
    String? btrn,
    String? contributor,
    String? contributorNote,
    String? createdDate,
    String? description,
    String? firstChapterLink,
    String? price,
    String? primaryIsbn10,
    String? primaryIsbn13,
    String? publisher,
    num? rank,
    num? rankLastWeek,
    String? sundayReviewLink,
    String? title,
    String? updatedDate,
    num? weeksOnList,
    List<BuyLinks>? buyLinks,
  }) =>
      Books(
        ageGroup: ageGroup ?? _ageGroup,
        amazonProductUrl: amazonProductUrl ?? _amazonProductUrl,
        articleChapterLink: articleChapterLink ?? _articleChapterLink,
        author: author ?? _author,
        bookImage: bookImage ?? _bookImage,
        bookImageWidth: bookImageWidth ?? _bookImageWidth,
        bookImageHeight: bookImageHeight ?? _bookImageHeight,
        bookReviewLink: bookReviewLink ?? _bookReviewLink,
        bookUri: bookUri ?? _bookUri,
        btrn: btrn ?? _btrn,
        contributor: contributor ?? _contributor,
        contributorNote: contributorNote ?? _contributorNote,
        createdDate: createdDate ?? _createdDate,
        description: description ?? _description,
        firstChapterLink: firstChapterLink ?? _firstChapterLink,
        price: price ?? _price,
        primaryIsbn10: primaryIsbn10 ?? _primaryIsbn10,
        primaryIsbn13: primaryIsbn13 ?? _primaryIsbn13,
        publisher: publisher ?? _publisher,
        rank: rank ?? _rank,
        rankLastWeek: rankLastWeek ?? _rankLastWeek,
        sundayReviewLink: sundayReviewLink ?? _sundayReviewLink,
        title: title ?? _title,
        updatedDate: updatedDate ?? _updatedDate,
        weeksOnList: weeksOnList ?? _weeksOnList,
        buyLinks: buyLinks ?? _buyLinks,
      );

  String? get ageGroup => _ageGroup;

  String? get amazonProductUrl => _amazonProductUrl;

  String? get articleChapterLink => _articleChapterLink;

  String? get author => _author;

  String? get bookImage => _bookImage;

  num? get bookImageWidth => _bookImageWidth;

  num? get bookImageHeight => _bookImageHeight;

  String? get bookReviewLink => _bookReviewLink;

  String? get bookUri => _bookUri;

  String? get btrn => _btrn;

  String? get contributor => _contributor;

  String? get contributorNote => _contributorNote;

  String? get createdDate => _createdDate;

  String? get description => _description;

  String? get firstChapterLink => _firstChapterLink;

  String? get price => _price;

  String? get primaryIsbn10 => _primaryIsbn10;

  String? get primaryIsbn13 => _primaryIsbn13;

  String? get publisher => _publisher;

  num? get rank => _rank;

  num? get rankLastWeek => _rankLastWeek;

  String? get sundayReviewLink => _sundayReviewLink;

  String? get title => _title;

  String? get updatedDate => _updatedDate;

  num? get weeksOnList => _weeksOnList;

  List<BuyLinks>? get buyLinks => _buyLinks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['age_group'] = _ageGroup;
    map['amazon_product_url'] = _amazonProductUrl;
    map['article_chapter_link'] = _articleChapterLink;
    map['author'] = _author;
    map['book_image'] = _bookImage;
    map['book_image_width'] = _bookImageWidth;
    map['book_image_height'] = _bookImageHeight;
    map['book_review_link'] = _bookReviewLink;
    map['book_uri'] = _bookUri;
    map['btrn'] = _btrn;
    map['contributor'] = _contributor;
    map['contributor_note'] = _contributorNote;
    map['created_date'] = _createdDate;
    map['description'] = _description;
    map['first_chapter_link'] = _firstChapterLink;
    map['price'] = _price;
    map['primary_isbn10'] = _primaryIsbn10;
    map['primary_isbn13'] = _primaryIsbn13;
    map['publisher'] = _publisher;
    map['rank'] = _rank;
    map['rank_last_week'] = _rankLastWeek;
    map['sunday_review_link'] = _sundayReviewLink;
    map['title'] = _title;
    map['updated_date'] = _updatedDate;
    map['weeks_on_list'] = _weeksOnList;
    if (_buyLinks != null) {
      map['buy_links'] = _buyLinks?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

BuyLinks buyLinksFromJson(String str) => BuyLinks.fromJson(json.decode(str));

String buyLinksToJson(BuyLinks data) => json.encode(data.toJson());

class BuyLinks {
  BuyLinks({
    String? name,
    String? url,
  }) {
    _name = name;
    _url = url;
  }

  BuyLinks.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }

  String? _name;
  String? _url;

  BuyLinks copyWith({
    String? name,
    String? url,
  }) =>
      BuyLinks(
        name: name ?? _name,
        url: url ?? _url,
      );

  String? get name => _name;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }
}
