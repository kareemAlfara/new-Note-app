import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:noteapp/data/notemodel.dart';
import 'package:noteapp/domain/usecase/addColorlist.dart';
import 'package:noteapp/presentation/FetchNotecubit/fetch_cubit.dart';
import 'package:noteapp/presentation/addnotecubit/addnote_cubit.dart';
import 'package:noteapp/services/components.dart';

class addNewNote extends StatelessWidget {
  const addNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddnoteCubit(),
      child:  BlocConsumer<AddnoteCubit, AddnoteState>(
      listener: (context, state) {
        if (state is AddnoteSuccess) {
          Navigator.pop(context);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AddnoteCubit.get(context);
        return SingleChildScrollView(
          child:
           Form(
            key: cubit.Formkey,
            child: Padding(
              padding: EdgeInsets.only(
                right: 11,
                left: 11,
                top: 11,
    
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
    
              child: Column(
                children: [
                  SizedBox(height: 55),
    
                  defulitTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please inter the title ";
                      }
                      return null;
                    },
                    controller: cubit.titleController,
                    title: "Title",
                  ),
                  SizedBox(height: 22),
                  defulitTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please inter the Subtitle ";
                      }
                      return null;
                    },
                    controller: cubit.SubtilteController,
                    maxline: 3,
                    title: "SubTitle",
                  ),
                  SizedBox(height: 22),
                  Container(height: 36 * 2, child: AddColorListview()),
                  SizedBox(height: 11),
    
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 33),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () async {
                      if (cubit.Formkey.currentState!.validate()) {
                        Notemodel notemodel = Notemodel(
                          Title: cubit.titleController.text,
                          SubTitle: cubit.SubtilteController.text,
                          Date: intl.DateFormat.yMMMMd().format(
                            DateTime.now(),
                          ),
                          color: Colors.blue.value,
                        );
                        await cubit.addNote(notemodel);
                          await  FetchCubit.get(context).fetchNote();
    
                        print(notemodel.Date);
                      }
    
                      cubit.Formkey.currentState!.save();
                    },
                    child: defulttext(
                      data: "Add",
                      color: Colors.white,
                      fSize: 22,
                    ),
                  ),
                  SizedBox(height: 55),
                ],
              ),
            ),
          ),
        );
      },
    ),
    )
  ;
  }
}
