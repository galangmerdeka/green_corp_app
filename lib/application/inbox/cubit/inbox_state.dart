part of 'inbox_cubit.dart';

@immutable
abstract class InboxState {}

class InboxInitial extends InboxState {}

class InboxLoading extends InboxState {}

class InboxError extends InboxState {
  final String errMessage;
  InboxError(this.errMessage);
}

class InboxSuccess extends InboxState {
  final List<InboxData?> inboxData;
  InboxSuccess(this.inboxData);
}
