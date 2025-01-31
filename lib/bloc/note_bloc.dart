import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState([])) {
    // Load initial data from SharedPreferences when the app starts
    on<LoadNotes>((event, emit) async {
      final pref = await SharedPreferences.getInstance();
      final notes = pref.getStringList('notes') ?? [];
      emit(NoteState(notes));
    });

    on<AddNote>((event, emit) async {
      final updateNotes = List<String>.from(state.notes)..add(event.note);
      SharedPreferences.getInstance()
          .then((value) => value.setStringList('notes', updateNotes));
      emit(NoteState(updateNotes));
    });

    on<DeleteNote>((event, emit) {
      final updateNotes = List<String>.from(state.notes)..remove(event.note);
      SharedPreferences.getInstance()
          .then((value) => value.setStringList('notes', updateNotes));
      emit(NoteState(updateNotes));
    });

    on<ClearNotes>((event, emit) {
      SharedPreferences.getInstance().then((value) => value.remove('notes'));
      emit(NoteState([]));
    });
  }
}
