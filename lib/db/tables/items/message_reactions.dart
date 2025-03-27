
class MessageReaction {
  String? reactionId;
  String? messageId;
  String? roomId;
  String? senderId;
  String? receiverId;
  String? emoji;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageReaction({
    this.reactionId,
    this.messageId,
    this.roomId,
    this.senderId,
    this.receiverId,
    this.emoji,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageReaction.fromMap(Map<String, dynamic> json) {
    return MessageReaction(
      reactionId: json['_id'],
      messageId: json['MessageID'],
      roomId: json['RoomID'],
      senderId: json['SenderID'],
      receiverId: json['ReceiverID'],
      emoji: json['Emoji'],
      status: json['Status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': reactionId,
      'MessageID': messageId,
      'RoomID': roomId,
      'SenderID': senderId,
      'ReceiverID': receiverId,
      'Emoji': emoji,
      'Status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}