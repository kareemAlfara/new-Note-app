import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/domain/usecase/addnewnote.dart';
import 'package:noteapp/presentation/widgets/noteListview.dart';
import 'package:noteapp/services/components.dart';
import 'package:noteapp/services/theme_notifier.dart';

class Notescreen extends StatelessWidget {
  const Notescreen({super.key, required this.themeNotifier});
 final ThemeNotifier themeNotifier;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: noteAppbar(
            text: "Note App",
            icon: Icons.brightness_6,
      
            onPressed: () {
                themeNotifier.toggleTheme();
            },
          ),
          body: noteListView(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => addNewNote(),
              );
            },
            child: Icon(Icons.add),
          ),
        );
  }
}
