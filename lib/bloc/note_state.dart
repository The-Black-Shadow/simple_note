part of 'note_bloc.dart';

class NoteState extends Equatable {
  final List<String> notes;
  const NoteState(this.notes);

  @override
  List<Object> get props => [notes];
}


