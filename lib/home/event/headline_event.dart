import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class HeadlineEvent extends Equatable {
  bool? load;
  HeadlineEvent({this.load});
}

// ignore: must_be_immutable
class LoadHeadlineNewsDataEvent extends HeadlineEvent {
  bool? isLoading;
  String? country;
  List? headline;

  LoadHeadlineNewsDataEvent({this.isLoading, this.country, this.headline})
      : super(load: isLoading);

  @override
  List<Object?> get props => [isLoading, country, headline];
}

// ignore: must_be_immutable
class AddToFavoriteEvent extends HeadlineEvent {
  String? title;
  String? picture;
  String? description;
  String? websiteLink;
  String? date;
  String? content;

  AddToFavoriteEvent({this.title, this.content, this.date, this.description, this.picture, this.websiteLink});

  @override
  List<Object?> get props => [title, content, date, description, picture, websiteLink];
}

// ignore: must_be_immutable
class RemoveFromFavoriteEvent extends HeadlineEvent {
  String? title;
  String? picture;
  String? description;
  String? websiteLink;
  String? date;
  String? content;

  RemoveFromFavoriteEvent({this.title, this.content, this.date, this.description, this.picture, this.websiteLink});

  @override
  List<Object?> get props => [title, content, date, description, picture, websiteLink];
}

// ignore: must_be_immutable
class SearchNewsEvent extends HeadlineEvent {
  String? searchValue;

  SearchNewsEvent({this.searchValue});

  @override
  List<Object?> get props => [searchValue];
}
