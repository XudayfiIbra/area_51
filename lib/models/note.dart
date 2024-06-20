import 'package:isar/isar.dart';
// generate file
part 'note.g.dart';


@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}
