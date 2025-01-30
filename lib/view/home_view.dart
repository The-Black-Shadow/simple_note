import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/note_bloc.dart';

class NoteApp extends StatelessWidget {
  final TextEditingController valueController = TextEditingController();

  NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc Notes'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NoteBloc>().add(ClearNotes());
            },
            icon: const Icon(Icons.delete_sweep),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: valueController,
                    decoration: const InputDecoration(
                      labelText: 'Value',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final value = valueController.text.trim();

                    if (value.isNotEmpty) {
                      context.read<NoteBloc>().add(AddNote(note: value));
                      valueController.clear();
                    }
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<NoteBloc, NoteState>(
              builder: (context, state) {
                final notes = state.notes;

                if (notes.isEmpty) {
                  return const Center(
                    child: Text('No notes added.'),
                  );
                }

                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(notes[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<NoteBloc>()
                              .add(DeleteNote(note: notes[index]));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
