part of 'editing_cubit.dart';

@immutable
sealed class EditingState {}

final class EditingInitial extends EditingState {}
final class EditingMovestate extends EditingState {}
