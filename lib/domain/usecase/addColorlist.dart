import 'package:flutter/material.dart';
import 'package:noteapp/presentation/addnotecubit/addnote_cubit.dart';
import 'package:noteapp/services/constant.dart';


class AddColorListview extends StatefulWidget {
  const AddColorListview({super.key});

  @override
  State<AddColorListview> createState() => _AddColorListviewState();
}

class _AddColorListviewState extends State<AddColorListview> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          currentindex = index;
          AddnoteCubit.get(context).color = colors[index];

          setState(() {});
          
        },
        child: currentindex == index
            ? CircleAvatar(
                radius: 36,
                backgroundColor: Colors.black,

                child: CircleAvatar(backgroundColor: colors[index], radius: 34),
              )
            : CircleAvatar(backgroundColor: colors[index], radius: 38),
      ),
      separatorBuilder: (context, index) => SizedBox(width: 11),
      itemCount: colors.length,
    );
  }
}
