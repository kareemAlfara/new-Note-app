import 'package:flutter/material.dart';
import 'package:noteapp/services/components.dart';


class editScreen extends StatelessWidget {
  const editScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 33),

            defulitTextFormField(title: "Title"),
            SizedBox(height: 22),
            defulitTextFormField(maxline: 3, title: "Content"),
          ],
        ),
      ),
    );
  }
}
