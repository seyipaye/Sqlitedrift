import 'package:drift/drift.dart';
import 'package:driftexample/db/tables/chat_message_entity.dart';
import 'package:driftexample/db/tables/items/chat_message_model.dart';
//
// class ChatMessageMapper {
//   // Convert from entity (database row) to model
//   static ChatMessage toModel(ChatMessagesEntity entity) {
//     return ChatMessage(
//       id: entity.id,
//       messageId: entity.messageId,
//       roomId: entity.roomId,
//       keyBundle: entity.keyBundle,
//       newMessage: entity.newMessage,
//       zenCall: entity.zenCall != null
//           ? ZenCall.fromBytes(entity.zenCall!)
//           : null,
//       isForwarded: entity.isForwarded,
//       localFilePath: entity.localFilePath != null
//           ? const ListToTextConverter().fromSql(entity.localFilePath!)
//           : null,
//       medias: entity.medias != null
//           ? const MessageMediaHolderTypeConverter().fromSql(entity.medias!)
//           : null,
//       senderId: entity.senderId,
//       sentAt: entity.sentAt,
//       deliveredAt: entity.deliveredAt,
//       readAt: entity.readAt,
//       createdAt: entity.createdAt,
//       isDeleted: entity.isDeleted,
//       readBy: const ListToTextConverter().fromSql(entity.readBy),
//       distributionKey: entity.distributionKey,
//       senderName: entity.senderName,
//       progress: entity.progress,
//       isDownloading: entity.isDownloading,
//       messageCreated: entity.messageCreated,
//       decrypted: entity.decrypted,
//       repliedMessageId: entity.repliedMessageId,
//       messageType: entity.messageType,
//       documentUrls: entity.documentUrls != null
//           ? const ListToTextConverter().fromSql(entity.documentUrls!)
//           : null,
//       deletedForMe: entity.deletedForMe,
//       reactions: entity.reactions != null
//           ? const MessageReactionTypeConverter().fromSql(entity.reactions!)
//           : null,
//       status: MessageStatus.values.byName(entity.status),
//     );
//   }
//
//   // Convert from model to entity (database row)
//   static ChatMessagesEntityCompanion toEntity(ChatMessage model) {
//     return ChatMessagesEntityCompanion(
//       id: Value(model.id),
//       messageId: Value(model.messageId),
//       roomId: Value(model.roomId),
//       keyBundle: Value(model.keyBundle),
//       newMessage: Value(model.newMessage),
//       zenCall: Value(model.zenCall?.toBytes()),
//       isForwarded: Value(model.isForwarded),
//       localFilePath: Value(model.localFilePath != null
//           ? const ListToTextConverter().toSql(model.localFilePath!)
//           : null),
//       medias: Value(model.medias != null
//           ? const MessageMediaHolderTypeConverter().toSql(model.medias!)
//           : null),
//       senderId: Value(model.senderId),
//       sentAt: Value(model.sentAt),
//       deliveredAt: Value(model.deliveredAt),
//       readAt: Value(model.readAt),
//       createdAt: Value(model.createdAt),
//       isDeleted: Value(model.isDeleted),
//       readBy: Value(const ListToTextConverter().toSql(model.readBy)),
//       distributionKey: Value(model.distributionKey),
//       senderName: Value(model.senderName),
//       progress: Value(model.progress),
//       isDownloading: Value(model.isDownloading),
//       messageCreated: Value(model.messageCreated),
//       decrypted: Value(model.decrypted),
//       repliedMessageId: Value(model.repliedMessageId),
//       messageType: Value(model.messageType),
//       documentUrls: Value(model.documentUrls != null
//           ? const ListToTextConverter().toSql(model.documentUrls!)
//           : null),
//       deletedForMe: Value(model.deletedForMe),
//       reactions: Value(model.reactions != null
//           ? const MessageReactionTypeConverter().toSql(model.reactions!)
//           : null),
//       status: Value(model.status.name),
//     );
//   }
// }
//
// // Helper extension for enum serialization
// extension on MessageStatus {
//   static MessageStatus byName(String name) {
//     return values.firstWhere(
//           (e) => e.name == name,
//       orElse: () => MessageStatus.unknown, // Provide a default if needed
//     );
//   }
// }
//
// // Example ZenCall serialization methods (you'll need to implement these)
// extension on ZenCall {
//   static ZenCall fromBytes(Uint8List bytes) {
//     // Implement your deserialization logic
//   }
//
//   Uint8List toBytes() {
//     // Implement your serialization logic
//   }
// }