part of 'fetch_cubit.dart';

@immutable
sealed class FetchState {}

final class FetchInitial extends FetchState {}
final class FetchNoteSuccess extends FetchState {}
final class FetchNoteloading  extends FetchState {}
final class FetchNotefailure extends FetchState {}
