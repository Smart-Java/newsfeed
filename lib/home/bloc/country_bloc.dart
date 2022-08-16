import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsfeed/home/event/country_event.dart';
import 'package:newsfeed/home/state/country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(const CountryState()) {
    on<AddCountryToCountryEvent>((event, emit) async {
      if (event.country != null) {
        await Future.delayed(Duration.zero);

        emit(state.copyWith(country: event.country));

        // ignore: avoid_print
        print('This is the state of the country ${state.country}');
      } else {
        emit(state.copyWith(country: 'us'));
      }
    });
    on<GetCountryFromCountryState>((event, emit) async {
      if (state.country != null) {
        await Future.delayed(Duration.zero);

        emit(state.copyWith(country: state.country));
      } else {
        emit(state.copyWith(country: 'us'));
      }
    });
  }
}
