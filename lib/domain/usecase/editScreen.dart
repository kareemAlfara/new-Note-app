import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/data/notemodel.dart';
import 'package:noteapp/presentation/FetchNotecubit/fetch_cubit.dart';
import 'package:noteapp/presentation/editingcubit/editing_cubit.dart';
import 'package:noteapp/services/components.dart';

class editScreen extends StatelessWidget {
  const editScreen({super.key, required this.model});
  final Notemodel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditingCubit()..edinigMove(model),
      child: Scaffold(
        appBar: noteAppbar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          text: "Editing",
          icon: Icons.edit,
          onPressed: () {},
        ),
        body: BlocBuilder<EditingCubit, EditingState>(
          builder: (context, state) {
            var cubit = EditingCubit().get(context);
            return Form(
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
                      onChanged: (value) => cubit.title = value,
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
                      onChanged: (value) => cubit.Subtitle = value,
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

                    SizedBox(height: 11),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 33),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () async {
                        model.Title = cubit.title ?? model.Title;
                        model.SubTitle = cubit.Subtitle ?? model.SubTitle;
                        model.save();
                        FetchCubit.get(context).fetchNote();
                        Navigator.pop(context);
                        if (cubit.Formkey.currentState!.validate()) {}
                        cubit.Formkey.currentState!.save();
                      },
                      child: defulttext(
                        data: "update",
                        color: Colors.white,
                        fSize: 22,
                      ),
                    ),
                    SizedBox(height: 55),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
