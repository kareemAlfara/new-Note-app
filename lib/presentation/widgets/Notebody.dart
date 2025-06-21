import 'package:flutter/material.dart';
import 'package:noteapp/data/notemodel.dart';
import 'package:noteapp/domain/usecase/editScreen.dart';
import 'package:noteapp/presentation/FetchNotecubit/fetch_cubit.dart';
import 'package:noteapp/services/components.dart';


class Notebody extends StatelessWidget {
  const Notebody({super.key, required this.notemodel});
  final Notemodel notemodel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigat(context, widget: editScreen(model: notemodel,)),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          color:Color(notemodel.color!),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: defulttext(data: notemodel.Title, fSize: 22),
              subtitle: defulttext(
                data: notemodel.SubTitle,
                fSize: 20,
                fw: FontWeight.bold,
                // color: Color(0xFF424242),
              ),
              trailing: IconButton(
                onPressed: () {
                    notemodel.delete();
                              FetchCubit.get(context).fetchNote();
                },
                icon: Icon(Icons.delete, size: 36,color: Colors.redAccent,),
              ),
            ),
            defulttext(data: notemodel.Date, fSize: 20),
          ],
        ),
      ),
    );
  }
}
