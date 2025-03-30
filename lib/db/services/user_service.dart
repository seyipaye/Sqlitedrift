import 'package:driftexample/db/tables/items/chat_message_model.dart';

import '../app_database.dart';
import '../db_provider.dart';
import 'package:drift/drift.dart';

class UserService {
  final AppDatabase _db = DBProvider.instance.database;

  Stream<List<User>> listen() {
    return _db.listenUsers;
  }

  Stream<List<ChatMessage>> listenMessages() {
    return _db.listenMessages;
  }

  Future<void> printRawSQLResults() async {
    final result = await _db
        .customSelect(
          'SELECT * FROM chat_messages_entity',
        )
        .get();

    for (final row in result) {
      print(row.data.toString()); // Print entire row as a map
    }
  }

  Future<int> insertUser(String name, String email) {
    return _db.into(_db.users).insert(
          UsersCompanion(
            name: Value(name),
            email: Value(email),
          ),
        );
  }

  Future<int> insertMessages(ChatMessage message) {
    print(message.toInsertable());
    return _db.into(_db.chatMessagesEntity).insert(message.toInsertable());
  }

  Future<List<User>> fetchAllUsers() {
    return _db.select(_db.users).get();
  }

  Future<bool> updateUser(User user) {
    return _db.update(_db.users).replace(user);
  }

  Future<int> deleteUser(int id) {
    return (_db.delete(_db.users)..where((tbl) => tbl.id.equals(id))).go();
  }
}

extension ChatMessageExt on ChatMessage {
  ChatMessagesEntityCompanion toInsertable() {
    // Start with required non-null fields
    var companion = ChatMessagesEntityCompanion(
      id: Value(id),
      messageId: Value(messageId),
      roomId: Value(roomId),
      isForwarded: Value(isForwarded),
      senderId: Value(senderId),
      createdAt: Value(createdAt),
      isDeleted: Value(isDeleted),
      readBy: Value(readBy),
      senderName: Value(senderName),
      progress: Value(progress),
      isDownloading: Value(isDownloading),
      messageCreated: Value(messageCreated),
      messageType: Value(messageType),
      status: Value(status),
    );

    // Add nullable fields using copyWith in a cascade
    return companion.copyWith(
      keyBundle: keyBundle != null ? Value(keyBundle!) : null,
      newMessage: newMessage != null ? Value(newMessage!) : null,
      zenCall: zenCall != null ? Value(zenCall!) : null,
      localFilePath: localFilePath != null ? Value(localFilePath!) : null,
      medias: medias != null ? Value(medias!) : null,
      sentAt: sentAt != null ? Value(sentAt!) : null,
      deliveredAt: deliveredAt != null ? Value(deliveredAt!) : null,
      readAt: readAt != null ? Value(readAt!) : null,
      distributionKey: distributionKey != null ? Value(distributionKey!) : null,
      decrypted: decrypted != null ? Value(decrypted!) : null,
      repliedMessageId:
          repliedMessageId != null ? Value(repliedMessageId!) : null,
      documentUrls: documentUrls != null ? Value(documentUrls!) : null,
      deletedForMe: deletedForMe != null ? Value(deletedForMe!) : null,
      reactions: reactions != null ? Value(reactions!) : null,
    );
  }
}
