import 'package:equatable/equatable.dart';

class HeadlinePageReadyState extends Equatable {
  const HeadlinePageReadyState(
      {this.list, this.message, this.isLoading = true});

  final String? message;
  final List? list;
  final bool? isLoading;

  @override
  List<Object?> get props => [message, list, isLoading];

  HeadlinePageReadyState copyWith({
    List? list,
    String? message,
    bool? isLoading,
  }) {
    return HeadlinePageReadyState(
      isLoading: isLoading,
      message: message,
      list: list,
    );
  }
}
