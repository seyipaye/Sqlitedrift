import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:driftexample/db/tables/chat_message_entity.dart';
import 'package:driftexample/db/tables/items/chat_message_model.dart';
import 'package:driftexample/db/tables/items/media_holder.dart';
import 'package:driftexample/db/tables/items/media_holder_type_converter.dart';
import 'package:driftexample/db/tables/items/message_reaction_type_converter.dart';
import 'package:driftexample/db/tables/items/message_reactions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Import table definitions
import 'tables/user_table.dart';
import 'tables/chat_message_entity.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(dir.path, 'app.db'));
    final lockFile = File('${dbFile.path}.lock');

    // Create and lock the file before database access
    final lock = await lockDatabase(lockFile);

    final database = NativeDatabase.createInBackground(
      dbFile,
      setup: (db) async {
        db.execute("PRAGMA journal_mode=WAL;"); // Enable WAL mode
        db.execute("PRAGMA busy_timeout = 5000;"); // 5s wait if locked
      },
      logStatements: true
    );

    // Unlock the file after database operations
    await unlockDatabase(lock);

    return database;
  });
}

Future<RandomAccessFile> lockDatabase(File lockFile) async {
  final raf = await lockFile.open(mode: FileMode.write);
  await raf.lock(FileLock.exclusive); // Prevent other processes from writing
  return raf;
}

Future<void> unlockDatabase(RandomAccessFile raf) async {
  await raf.unlock(); // Release the lock
  await raf.close();
}

@DriftDatabase(tables: [Users, ChatMessagesEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
  );

  Stream<List<User>> get listenUsers => select(users).watch();
  Stream<List<ChatMessage>> get listenMessages => select(chatMessagesEntity).watch();
// Optionally, add global queries here if needed
}
