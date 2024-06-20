import 'package:area_51/models/note.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDB extends ChangeNotifier {
  static late Isar isar;
  // init DB
  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  // list of notes
  final List<Note> currentNote = [];

  // Create

  Future<void> addNote(String textFromUser) async {
    // create new note
    final newNote = Note()..text = textFromUser;

    // save to DB
    await isar.writeTxn(() => isar.notes.put(newNote));

    // re-reade note
    fetchNote();
  }

  // Read
  Future<void> fetchNote() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNote.clear();
    currentNote.addAll(fetchedNotes);
    notifyListeners();
  }

  // Update
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(
        () => isar.notes.put(existingNote),
      );
      await fetchNote();
    }
  }

  // Delete
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNote();
  }
}
