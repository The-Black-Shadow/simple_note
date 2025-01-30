import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_note/bloc/note_bloc.dart';
import 'package:simple_note/view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NoteBloc()
              ..add(LoadNotes())), //for triggering the LoadNotes event
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Simple Note',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: NoteApp(),
        ),
      ),
    );
  }
}
