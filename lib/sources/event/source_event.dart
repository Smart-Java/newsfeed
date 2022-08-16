import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class SourceEvent extends Equatable {
  bool? load;
  SourceEvent({this.load});
}

// ignore: must_be_immutable
class LoadSourceNewsEvent extends SourceEvent {
  bool? isLoading;
  String? country;
  String? categoryList;

  LoadSourceNewsEvent({this.isLoading, this.country, this.categoryList}) : super(load: isLoading);

  @override
  List<Object?> get props => [isLoading, country, categoryList];
}

// ignore: must_be_immutable
class ChangeCategoryStateEvent extends SourceEvent{
  bool? isLoading;
  int? position;

  ChangeCategoryStateEvent({this.isLoading, this.position,}) : super(load: isLoading);

  @override
  List<Object?> get props => [isLoading, position];
}

// ignore: must_be_immutable
class GetNewsBaseOnSourceEvent extends SourceEvent{
  bool? isLoading;
  String? sourceValue;

  GetNewsBaseOnSourceEvent({this.isLoading, this.sourceValue,}) : super(load: isLoading);

  @override
  List<Object?> get props => [isLoading, sourceValue];
}
