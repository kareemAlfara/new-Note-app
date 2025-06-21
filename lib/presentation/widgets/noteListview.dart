import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/presentation/FetchNotecubit/fetch_cubit.dart';
import 'package:noteapp/presentation/widgets/Notebody.dart';

class noteListView extends StatelessWidget {
  const noteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCubit, FetchState>(
      builder: (context, state) {
      
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                Notebody(notemodel: FetchCubit.get(context).notelist![index]),
            separatorBuilder: (context, index) => SizedBox(height: 1),
            
            itemCount: FetchCubit.get(context).notelist!.length,
          );
      
      },
    );
  }
}
