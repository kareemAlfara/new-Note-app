import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/data/notemodel.dart';

part 'editing_state.dart';

class EditingCubit extends Cubit<EditingState> {
  EditingCubit() : super(EditingInitial());
  EditingCubit get(context) => BlocProvider.of(context);
  var titleController = TextEditingController();
  var SubtilteController = TextEditingController();
  var Formkey = GlobalKey<FormState>();
  String ?title;
  String ?Subtitle;
  edinigMove(Notemodel? model) {
    titleController.text = model!.Title;
    SubtilteController.text = model.SubTitle;
    emit(EditingMovestate());
  }
}
