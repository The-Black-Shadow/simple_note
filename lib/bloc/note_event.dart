part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class AddNote extends NoteEvent {
  final String note;

  const AddNote({
    required this.note,
  });

  @override
  List<Object> get props => [note];
}

class DeleteNote extends NoteEvent {
  final String note;

  const DeleteNote({
    required this.note,
  });

  @override
  List<Object> get props => [note];
}

class ClearNotes extends NoteEvent {
  const ClearNotes();
}

class LoadNotes extends NoteEvent {}
