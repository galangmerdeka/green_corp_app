part of 'check_status_cubit.dart';

@immutable
abstract class CheckStatusState {}

class CheckStatusInitial extends CheckStatusState {}

class InboxLoadingCheckStatus extends CheckStatusState {}

class InboxCheckStatusError extends CheckStatusState {
  final String errMessage;
  InboxCheckStatusError(this.errMessage);
}

class InboxCheckStatusSuccess extends CheckStatusState {
  final String data;
  InboxCheckStatusSuccess(this.data);
}
