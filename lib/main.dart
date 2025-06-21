import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/data/notemodel.dart';
import 'package:noteapp/presentation/FetchNotecubit/fetch_cubit.dart';
import 'package:noteapp/presentation/editingcubit/editing_cubit.dart';
import 'package:noteapp/presentation/screens/noteScreen.dart';
import 'package:noteapp/services/components.dart';
import 'package:noteapp/services/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotemodelAdapter());
  await Hive.openBox<Notemodel>(Notebox);
  runApp(myApp());
}

class myApp extends StatelessWidget {
  final ThemeNotifier themeNotifier = ThemeNotifier();
  myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => FetchCubit()..fetchNote()),
            BlocProvider(create: (context) => EditingCubit()),
          ],
          child: MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            home: Notescreen(themeNotifier: themeNotifier),
          ),
        );
      },
    );
  }
}
