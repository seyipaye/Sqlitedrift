import 'package:drift/drift.dart';
import 'package:driftexample/db/tables/items/chat_message_model.dart';
import 'package:driftexample/db/tables/items/media_holder_type_converter.dart';
import 'package:driftexample/db/tables/items/message_reaction_type_converter.dart';

@UseRowClass(ChatMessage)
class ChatMessagesEntity extends Table {
  TextColumn get id => text()();
  TextColumn get messageId => text().unique()();
  TextColumn get roomId => text()();
  TextColumn get keyBundle => text().nullable()();
  TextColumn get newMessage => text().nullable()();
  TextColumn get zenCall =>text().nullable().map(const ZenCallTypeConverter())(); // Assuming ZenCall needs to be serialized
  BoolColumn get isForwarded => boolean().withDefault(const Constant(false))();
  TextColumn get localFilePath => text().nullable().map(const ListToTextConverter())(); // Requires custom converter
  TextColumn get medias => text().nullable().map(const MessageMediaHolderTypeConverter())(); // Requires custom converter
  TextColumn get senderId => text()();
  DateTimeColumn get sentAt => dateTime().nullable()();
  DateTimeColumn get deliveredAt => dateTime().nullable()();
  DateTimeColumn get readAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  TextColumn get readBy => text().map(const ListToTextConverter())(); // Requires custom converter
  TextColumn get distributionKey => text().nullable()();
  TextColumn get senderName => text()();
  RealColumn get progress => real().withDefault(const Constant(0.0))();
  BoolColumn get isDownloading => boolean().withDefault(const Constant(false))();
  TextColumn get messageCreated => text()();
  BoolColumn get decrypted => boolean().nullable()();
  TextColumn get repliedMessageId => text().nullable()();
  TextColumn get messageType => text()();
  TextColumn get documentUrls => text().nullable().map(const ListToTextConverter())(); // Requires custom converter
  BoolColumn get deletedForMe => boolean().nullable()();
  TextColumn get reactions => text().nullable().map(const MessageReactionTypeConverter())(); // Requires custom converter
  TextColumn get status => textEnum<MessageStatus>()(); // Assuming MessageStatus is an enum

  @override
  Set<Column> get primaryKey => {id};
}

// Example custom converters you'll need to implement:
class ListToTextConverter extends TypeConverter<List<String>, String> {
  const ListToTextConverter();

  @override
  List<String> fromSql(String fromDb) {
    return fromDb.split(',');
  }

  @override
  String toSql(List<String> value) {
    return value.join(',');
  }
}


