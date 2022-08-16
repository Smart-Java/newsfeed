import 'package:equatable/equatable.dart';

class CountryState extends Equatable {

  const CountryState({this.country});

  final String? country;
  
  @override
  List<Object?> get props => [country];

  CountryState copyWith({
    String? country,
  }) {
    return CountryState(
      country: country
    );
  }
}