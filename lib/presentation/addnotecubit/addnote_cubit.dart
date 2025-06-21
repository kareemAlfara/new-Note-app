import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/data/notemodel.dart';
import 'package:noteapp/services/components.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());
  static AddnoteCubit get(context) => BlocProvider.of(context);
  var titleController = TextEditingController();
  var SubtilteController = TextEditingController();
  var Formkey = GlobalKey<FormState>();
  Color color =  Color(0xFF546E7A);

  addNote(Notemodel note) async {
    try {
      emit(AddnoteLoading());
      note.color = color.value;
      var notebox = Hive.box<Notemodel>(Notebox);
      await notebox.add(note);
      emit(AddnoteSuccess());
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      emit(Addnotefailure(error: e.toString()));
    }
  }
}
