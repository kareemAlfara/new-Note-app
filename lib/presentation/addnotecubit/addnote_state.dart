part of 'addnote_cubit.dart';

@immutable
sealed class AddnoteState {}

final class AddnoteInitial extends AddnoteState {}

final class AddnoteLoading extends AddnoteState {}

final class AddnoteSuccess extends AddnoteState {}

final class Addnotefailure extends AddnoteState {
  final String error;

  Addnotefailure({required this.error});
}
