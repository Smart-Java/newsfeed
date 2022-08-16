import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsfeed/home/event/headline_event.dart';
import 'package:newsfeed/home/repo/headline_repo.dart';
import 'package:newsfeed/home/state/headline_page_state.dart';

class HeadlineBloc extends Bloc<HeadlineEvent, HeadlinePageReadyState> {
  final HeadlineRepo headlineRepo = HeadlineRepo();
  List favoriteList = [];

  HeadlineBloc() : super(const HeadlinePageReadyState()) {
    on<LoadHeadlineNewsDataEvent>((event, emit) async {
      if (event.load == true) {
        if (event.headline == null || event.headline!.isEmpty) {
          var category = '';
          var response = await headlineRepo.fineTuneDataForRequest(
              event.country, category);
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
          String queryString = '';
          for (var i = 0; i < event.headline!.length; i++) {
            if (i == 0) {
              queryString += event.headline![i];
            } else {
              queryString += '&${event.headline![i]}';
            }
          }
          var response = await headlineRepo.fineTuneDataForRequest(
              event.country, queryString);
          var isLoading = response['isLoading'];
          var message = response['message'];
          var list = response['list'] as List;

          await Future.delayed(Duration.zero);

          emit(state.copyWith(
            list: list,
            message: message,
            isLoading: isLoading,
          ));
        }
      } else {
        emit(state.copyWith(
          list: [],
          message: 'message',
          isLoading: false,
        ));
      }
    });

    on<AddToFavoriteEvent>((event, emit) {
      if (event.content != null ||
          event.date != null ||
          event.description != null ||
          event.picture != null ||
          event.picture != null ||
          event.title != null) {
        favoriteList.add({
          'title': event.title,
          'picture': event.picture,
          'description': event.description,
          'websiteLink': event.websiteLink,
          'content': event.content,
          'date': event.date
        });

        emit(state.copyWith(
          list: favoriteList,
          message: 'Success',
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(
          list: [],
          message: 'Error Occured',
          isLoading: false,
        ));
      }
    });

    on<RemoveFromFavoriteEvent>((event, emit) {
      if (event.content != null ||
          event.date != null ||
          event.description != null ||
          event.picture != null ||
          event.picture != null ||
          event.title != null) {
        favoriteList.remove({
          'title': event.title,
          'picture': event.picture,
          'description': event.description,
          'websiteLink': event.websiteLink,
          'content': event.content,
          'date': event.date
        });

        emit(state.copyWith(
          list: favoriteList,
          message: 'Success',
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(
          list: [],
          message: 'Error Occured',
          isLoading: false,
        ));
      }
    });

    on<SearchNewsEvent>((event, emit) async {
      if (event.searchValue != null) {
          var response = await headlineRepo
              .fineTuneDataForSearchRequest(event.searchValue);
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
