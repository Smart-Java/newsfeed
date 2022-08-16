import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsfeed/sources/event/source_event.dart';
import 'package:newsfeed/sources/repo/source_repo.dart';
import 'package:newsfeed/sources/state/source_state.dart';

class SourceNewsDataBloc extends Bloc<SourceEvent, SourcePageReadyState> {
  final SourceRepo sourceRepo = SourceRepo();

  SourceNewsDataBloc() : super(const SourcePageReadyState()) {
    on<LoadSourceNewsEvent>((event, emit) async {
      if (event.load == true) {
        var response = await sourceRepo.fineTuneDataForRequest(
            event.country, event.categoryList);
        var isLoading = response['isLoading'];
        var message = response['message'];
        var list = response['list'] as List;
        await Future.delayed(Duration.zero);

        emit(state.copyWith(
          list: list,
          message: message,
          isLoading: isLoading,
        ));
      } else {
        emit(state.copyWith(
          list: [],
          message: 'message',
          isLoading: false,
        ));
      }
    });

    on<ChangeCategoryStateEvent>((event, emit) {
      if (event.position == null) {
        emit(state.copyWith(currentState: event.position));
      } else {
        emit(state.copyWith(currentState: event.position));
        print('okay${state.currentState}');
      }
    });

    on<GetNewsBaseOnSourceEvent>((event, emit) async {
      if (event.sourceValue != null) {
          var response = await sourceRepo
              .fineTuneDataFromSourceForRequest(event.sourceValue);
          var isLoading = response['isLoading'];
          var message = response['message'];
          var list = response['list'] as List;

          await Future.delayed(Duration.zero);

          emit(state.copyWith(
            list: list,
            message: message,
            isLoading: isLoading,
          ));
        } else {
          emit(state.copyWith(
            list: [],
            message: 'Value excepted for search',
            isLoading: false,
          ));
        }
    });
  }
}
