import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class CountryEvent extends Equatable {
}

// ignore: must_be_immutable
class AddCountryToCountryEvent extends CountryEvent {
  String? country;

  AddCountryToCountryEvent({this.country});

  @override
  List<Object?> get props => [country];
}

// ignore: must_be_immutable
class GetCountryFromCountryState extends CountryEvent {
  @override
  List<Object?> get props => [];
}
