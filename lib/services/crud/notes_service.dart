// import 'package:my_notes/services/crud/crud_exceptions.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' show join;

// class NotesService {
//   Future<void> open() async {
//     Database? _db;
//     if (_db != null) throw FileAlreadyOpened();
//   }
// }

// class DatabaseUser {
//   final int id;
//   final String email;

//   DatabaseUser({required this.id, required this.email});
//   DatabaseUser.fromRow(Map<String, Object?> map)
//     : id = map[idColumn] as int,
//       email = map as String;

//   @override
//   String toString() => "person ,Id =$id , email = $email";
//   @override
//   bool operator ==(covariant DatabaseUser other) {
//     return id == other.id;
//   }

//   @override
//   int get hashCode => id.hashCode;
// }

// class DatabaseNotes {
//   final int id;
//   final int userId;
//   final String text;

//   DatabaseNotes({required this.text, required this.id, required this.userId});

//   DatabaseNotes.fromRow(Map<String, Object?> map)
//     : id = map[idColumn] as int,
//       userId = map[userIdColumn] as int,
//       text = map[textColumn] as String;
//   @override
//   bool operator ==(covariant DatabaseNotes other) {
//     return id == other.id;
//   }

//   @override
//   int get hashCode => id.hashCode;
// }

// // constants
// const notes = "notes.db";
// const idColumn = "id";
// const emailColumn = "email";
// const userIdColumn = "user_id";
// const textColumn = "text";
