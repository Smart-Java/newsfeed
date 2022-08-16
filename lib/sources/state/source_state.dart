import 'package:equatable/equatable.dart';

class SourcePageReadyState extends Equatable {
  const SourcePageReadyState({this.list, this.message, this.currentState, this.isLoading = true});

  final String? message;
  final List? list;
  final bool? isLoading;
  final int? currentState;

  @override
  List<Object?> get props => [message, list, isLoading];

  SourcePageReadyState copyWith({
    List? list,
    String? message,
    bool? isLoading,
    int? currentState
  }) {
    return SourcePageReadyState(
      isLoading: isLoading,
      message: message,
      list: list,
      currentState: currentState
    );
  }
}
