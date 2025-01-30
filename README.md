# Simple Note

Simple Note is a Flutter application that allows users to create, view, and delete notes. The app uses the Bloc pattern for state management and stores notes using the `shared_preferences` package.

## Features

- Add new notes
- View a list of notes
- Delete individual notes
- Clear all notes

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- An IDE such as Visual Studio Code or Android Studio

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/The-Black-Shadow/simple_note.git
   cd simple_note
   ```

2. Install dependencies:

   ```sh
   flutter pub get
   ```

3. Run the app:
   ```sh
   flutter run
   ```

## Project Structure

- : Contains the main source code for the app
  - `bloc/`: Contains the Bloc implementation for managing notes
    - : Bloc class for handling note events and states
    - `note_event.dart`: Defines the events for the NoteBloc
    - `note_state.dart`: Defines the states for the NoteBloc
  - : Contains the UI components of the app
    - : Main view of the app where notes are displayed
  - : Main app widget
  - : Entry point of the app
  - `note_observer.dart`: Observer for Bloc events and transitions

## Dependencies

- `flutter_bloc`: State management using the Bloc pattern
- `shared_preferences`: Persistent storage for notes
- `flutter_screenutil`: Responsive UI design

## Usage

### Adding a Note

1. Enter the note text in the text field at the top of the screen.
2. Press the "+" button to add the note to the list.

### Deleting a Note

1. Press the trash icon next to the note you want to delete.

### Clearing All Notes

1. Press the trash sweep icon in the app bar to clear all notes.

## Testing

Run the widget tests:

```sh
flutter test

```
