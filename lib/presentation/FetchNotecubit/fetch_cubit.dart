import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/data/notemodel.dart';
import 'package:noteapp/services/components.dart';

part 'fetch_state.dart';

class FetchCubit extends Cubit<FetchState> {
  FetchCubit() : super(FetchInitial());
  static FetchCubit get(context) => BlocProvider.of(context);
  List<Notemodel>? notelist;
  fetchNote() async {
    try {
      emit(FetchNoteloading());
      var notebox = Hive.box<Notemodel>(Notebox);
      notelist = notebox.values.toList();
      emit(FetchNoteSuccess());
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      emit(FetchNotefailure());
    }
  }
}
