import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:simple_note/app.dart';
import 'package:simple_note/note_observer.dart';

void main() async {
  Bloc.observer = NoteObserver();
  runApp(const MyApp());
}
