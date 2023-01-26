part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryError extends HistoryState {
  final String errMessage;
  HistoryError(this.errMessage);
}

class HistorySuccess extends HistoryState {
  final List<History?> history;
  HistorySuccess(this.history);
}
