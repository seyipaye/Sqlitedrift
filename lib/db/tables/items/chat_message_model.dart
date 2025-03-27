// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import "dart:core";

import 'package:driftexample/db/tables/items/media_holder.dart';
import 'package:driftexample/db/tables/items/message_reactions.dart';
import 'package:equatable/equatable.dart';



enum MessageStatus {
  saved,
  sent,
  delivered,
  read,
  downloading,
  decryptionFailure,
  failed;

  factory MessageStatus.fromString(String status) {
    switch (status) {
      case 'downloading':
        return MessageStatus.downloading;
      case 'decryptionFailure':
        return MessageStatus.decryptionFailure;
      case 'saved':
        return MessageStatus.saved;
      case 'sent':
        return MessageStatus.sent;
      case 'delivered':
        return MessageStatus.delivered;
      case 'read':
        return MessageStatus.read;
      case 'failed':
        return MessageStatus.failed;
      default:
        return MessageStatus.saved;
    }
  }

  @override
  String toString() {
    switch (this) {
      case MessageStatus.downloading:
        return 'downloading';
      case MessageStatus.decryptionFailure:
        return 'decryptionFailure';
      case MessageStatus.saved:
        return 'saved';
      case MessageStatus.sent:
        return 'sent';
      case MessageStatus.delivered:
        return 'delivered';
      case MessageStatus.read:
        return 'read';
      case MessageStatus.failed:
        return 'failed';
    }
  }
}

enum MediaType {
  image,
  unknown,
  video;

  factory MediaType.fromString(String type) {
    switch (type) {
      case 'image':
        return MediaType.image;
      case 'video':
        return MediaType.video;
      default:
        return MediaType.unknown;
    }
  }

  @override
  String toString() {
    switch (this) {
      case MediaType.image:
        return 'image';
      case MediaType.video:
        return 'video';
      case MediaType.unknown:
        return 'unknown';
    }
  }
}

enum MessageMediaOrientation {
  portrait,
  landscape;

  factory MessageMediaOrientation.fromString(String status) {
    switch (status) {
      case 'portrait':
        return MessageMediaOrientation.portrait;
      case 'landscape':
        return MessageMediaOrientation.landscape;
      default:
        return MessageMediaOrientation.portrait;
    }
  }

  @override
  String toString() {
    switch (this) {
      case MessageMediaOrientation.portrait:
        return 'portrait';
      case MessageMediaOrientation.landscape:
        return 'landscape';
    }
  }
}


class ChatMessage extends Equatable {
  final String id;
  final String messageId;
  final String roomId;
  final String? keyBundle;
  final String? newMessage;
  final ZenCall? zenCall;
  final bool isForwarded;
  final List<String>? localFilePath;
  final List<MessageMediaHolder>? medias;
  final String senderId;
  final DateTime? sentAt;
  final DateTime? deliveredAt;
  final DateTime? readAt;
  final DateTime createdAt; //re-write this field as db local save time.
  final bool isDeleted;
  final List<String> readBy;
  final String? distributionKey;
  final String senderName;
  final double progress;
  final bool isDownloading;
  final String messageCreated;
  final bool? decrypted;
  final String? repliedMessageId;
  final String messageType;
  final List<String>? documentUrls;
  final bool? deletedForMe;
  final List<MessageReaction>? reactions;
  final MessageStatus status;

  ChatMessage({
    required this.id,
    this.keyBundle,
    this.documentUrls,
    this.deletedForMe,
    required this.isForwarded,
    required this.messageType,
    this.repliedMessageId,
    required this.messageId,
    required this.roomId,
    this.newMessage,
    this.zenCall,
    this.localFilePath,
    required this.senderId,
    this.sentAt,
    this.deliveredAt,
    this.progress = 0,
    this.isDownloading = false,
    this.readAt,
    required this.createdAt,
    required this.isDeleted,
    required this.readBy,
    this.distributionKey,
    required this.senderName,
    required this.status,
    required this.messageCreated,
    this.decrypted,
    this.reactions,
    this.medias,
  });


  @override
  String get uniqueId => messageId;

  ChatMessage copyWith({String? id,
    bool? messageDeletingFlag,
    bool? deletedForMe,
    List<String>? documentUrls,
    String? messageType,
    bool? isForwarded,
    String? messageId,
    String? roomId,
    String? newMessage,
    ZenCall? zenCall,
    List<String>? localFilePath,
    String? repliedMessageId,
    String? senderId,
    DateTime? sentAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    bool? isDeleted,
    bool? isDownloading,
    List<String>? readBy,
    String? distributionKey,
    String? senderName,
    MessageStatus? status,
    DateTime? createdAt,
    String? messageCreated,
    List<MessageReaction>? reactions,
    List<MessageMediaHolder>? medias,
    bool? decrypted}) {
    return ChatMessage(
      documentUrls: documentUrls ?? this.documentUrls,
      isForwarded: isForwarded ?? this.isForwarded,
      messageType: messageType ?? this.messageType,
      medias: medias ?? this.medias,
      repliedMessageId: repliedMessageId ?? this.repliedMessageId,
      id: id ?? this.id,
      isDownloading: isDownloading ?? this.isDownloading,
      messageId: messageId ?? this.messageId,
      roomId: roomId ?? this.roomId,
      deletedForMe: deletedForMe ?? this.deletedForMe,
      newMessage: messageDeletingFlag != null && messageDeletingFlag == true
          ? null
          : newMessage ?? this.newMessage,
      zenCall: zenCall ?? this.zenCall,
      localFilePath: messageDeletingFlag != null && messageDeletingFlag == true
          ? null
          : localFilePath ?? this.localFilePath,
      senderId: senderId ?? this.senderId,
      sentAt: sentAt ?? this.sentAt,
      deliveredAt: deliveredAt ?? this.deliveredAt,
      readAt: readAt ?? this.readAt,
      isDeleted: isDeleted ?? this.isDeleted,
      readBy: readBy ?? this.readBy,
      distributionKey: distributionKey ?? this.distributionKey,
      senderName: senderName ?? this.senderName,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      messageCreated: messageCreated ?? this.messageCreated,
      decrypted: decrypted ?? this.decrypted,
      reactions: reactions ?? this.reactions,
    );
  }



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "repliedMessageId": repliedMessageId,
      'id': id,
      'messageId': messageId,
      'roomId': roomId,
      "isForwarded": isForwarded,
      'message': newMessage,
      "zenCall": zenCall,
      'localFilePath': localFilePath,
      'senderId': senderId,
      'sentAt': sentAt?.toIso8601String(),
      'deliveredAt': deliveredAt?.toIso8601String(),
      'readAt': readAt?.toIso8601String(),
      'isDeleted': isDeleted,
      'readBy': readBy,
      'distributionKey': distributionKey,
      'senderName': senderName,
      'status': status,
      "messageCreated": messageCreated,
      "documentUrls": documentUrls,
      "decrypted": decrypted,
      "reactions": reactions?.map((r) => r.toMap()).toList(),
      "media": medias?.map((r) => r.toMap()).toList() ?? [],
    };
  }

  factory ChatMessage.createLocal({
    required String roomId,
    String? callId,
    String? messageType,
    String? newMessage,
    ZenCall? zenCall,
    bool? isForwarded,
    bool? isDownloading,
    MessageMediaOrientation? messageMediaOrientation,
    String? repliedMessageId,
    List<MessageMediaHolder>? medias,
    required String senderId,
    // List<String>? filetype,
    List<String>? localFilePath,
    List<MessageReaction>? reactions,
  }) {
    return ChatMessage(
        zenCall: zenCall,
        isForwarded: isForwarded ?? false,
        messageType: messageType ?? "message",
        repliedMessageId: repliedMessageId,
        id:(newMessage??"")+DateTime.now().toIso8601String().toString(),
        messageId: DateTime.now().toIso8601String() ??"",
        roomId: roomId,
        localFilePath: localFilePath,
        newMessage: newMessage,
        senderId: senderId,
        createdAt: DateTime.now(),
        isDeleted: false,
        readBy: [],
        senderName: "",
        status: MessageStatus.saved,
        reactions: reactions ?? [],
        medias: medias,
        isDownloading: isDownloading ?? false,
        messageCreated: DateTime.now().toUtc().toIso8601String());
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map,) {
    return ChatMessage(
        keyBundle: map["keyBundle"] as String?,
        isForwarded: map["isForwarded"] ?? false,
        messageType: (map["messageType"] as String?) ?? "message",
        repliedMessageId: map['repliedMessageId'] as String?,
        id: map['id'] ,
        messageId: map['messageId'] as String,
        roomId: map['roomId'] as String,
        newMessage: map['newMessage'] as String?,
        documentUrls: (map['documentUrls'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
            [],
        localFilePath: null,
        senderId: map['senderId'] as String,
        sentAt: map['sentAt'] != null
            ? DateTime.parse(map['sentAt'] as String)
            : null,
        deliveredAt: map['deliveredAt'] != null
            ? DateTime.parse(map['deliveredAt'] as String)
            : null,
        readAt: map['readAt'] != null
            ? DateTime.parse(map['readAt'] as String)
            : null,
        createdAt: map['createdAt'] != null
            ? DateTime.parse(map['createdAt'] as String)
            : DateTime.parse(map['messageCreated'] as String),
        isDeleted: map['isDeleted'] ?? false,
        readBy: (map['readBy'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
            [],
        distributionKey: map['distributionKey'] as String?,
        senderName: map['senderName'] as String? ?? "Unknown",
        status: MessageStatus.fromString('${map['status']}'),
        medias: (map['media'] as List<dynamic>?)
            ?.map((e) => MessageMediaHolder.fromMap(e))
            .toList(),
        messageCreated: map['messageCreated'] as String);
  }

  factory ChatMessage.fromMapForPending(Map<String, dynamic> map) {
    return ChatMessage(
        isForwarded: map["isForwarded"] ?? false,
        messageType: map["messageType"] as String,
        id: map['id'] ,
        messageId: map['messageId'] as String,
        roomId: map['roomId'] as String,
        newMessage:
        map['newMessage'] != null ? map['newMessage'] as String : null,
        localFilePath: null,
        senderId: map['senderId'] as String,
        sentAt: map['sentAt'] != null
            ? DateTime.parse(map['sentAt'] as String)
            : null,
        deliveredAt: map['deliveredAt'] != null
            ? DateTime.parse(map['deliveredAt'] as String)
            : null,
        readAt: map['readAt'] != null
            ? DateTime.parse(map['readAt'] as String)
            : null,
        createdAt: DateTime.parse(map['createdAt'] as String),
        isDeleted: map['isDeleted'] == null ? false : map['isDeleted'] as bool,
        readBy:
        (map['readBy'] as List<dynamic>).map((e) => e as String).toList(),
        medias: (map['media'] as List<dynamic>?)
            ?.map((e) => MessageMediaHolder.fromMap(e))
            .toList(),
        distributionKey: map['distributionKey'] != null
            ? map['distributionKey'] as String
            : null,
        senderName: map['senderName'] ?? "Unknown",
        status: MessageStatus.fromString('${map['status']}'),
        messageCreated: map["metaData"]['messageCreated'] as String);
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatMessage(id: $id, media: $medias, deletedForMe: $deletedForMe,messageId: $messageId, roomId: $roomId,isForwarded:$isForwarded, message: $newMessage, localFilePath: $localFilePath,senderId: $senderId, sentAt: $sentAt, deliveredAt: $deliveredAt, readAt: $readAt, isDeleted: $isDeleted, readBy: $readBy, distributionKey: $distributionKey, senderName: $senderName, status: $status,messageCreated: $messageCreated,decrypted:$decrypted,repliedMessageId:$repliedMessageId,messageType:$messageType,documentUrls:$documentUrls,zenCall:$zenCall, reactions:$reactions)';
  }

  bool isVideoNote() {
    return localFilePath != null && messageType == "videoNote";
  }

  bool isMedia() {
    return localFilePath != null && messageType == "image" ||
        localFilePath != null &&
            messageType == "video" ||
        localFilePath != null &&
            messageType == "videoNote";
  }

  bool isImageOrVideo() {
    return localFilePath != null && messageType == "image" ||
        localFilePath != null &&
            messageType == "video" || localFilePath != null &&
        messageType == "media";
  }



  String getThumbFile() {
    final media = medias?.firstOrNull;
    final thumbFromLocalFile = localFilePath?.elementAtOrNull(1);
    final mediaFileThumb = media?.thumbNail;
    final file = mediaFileThumb ?? thumbFromLocalFile ?? "";

    return file;
  }

  String getPath() {
    return localFilePath?.firstOrNull ?? "";
  }


  String getNetwork() {
    final url =
        documentUrls?.firstOrNull ?? documentUrls?.elementAtOrNull(1) ?? "";
    return url.isEmpty ? "" : "https://media.tezda.com/$url";
  }

  String getNetworkThumb() {
    return documentUrls?.elementAtOrNull(1) ?? documentUrls?.firstOrNull ?? "";
  }

  MediaType getMediaType() {
    return messageType.toLowerCase() == "video"
        ? MediaType.video
        : MediaType.image;
  }

  bool isVideo() {
    return messageType.toLowerCase() == "video";
  }


  @override
  List<Object?> get props =>
      [
        id,
        messageId,
        roomId,
        keyBundle,
        newMessage,
        zenCall,
        isForwarded,
        localFilePath,
        medias,
        senderId,
        sentAt,
        deliveredAt,
        readAt,
        createdAt,
        isDeleted,
        readBy,
        distributionKey,
        senderName,
        progress,
        isDownloading,
        messageCreated,
        decrypted,
        repliedMessageId,
        messageType,
        documentUrls,
        deletedForMe,
        reactions,
        status,
      ];
}

enum CallStatus {
  connecting,
  ringing,
  connected,
  missed,
  noAnswer,
  cancelled,
  completed;

  factory CallStatus.fromString(String status) {
    switch (status) {
      case 'connecting':
        return CallStatus.connecting;
      case 'ringing':
        return CallStatus.ringing;
      case 'connected':
        return CallStatus.connected;
      case 'missed':
        return CallStatus.missed;
      case 'noAnswer':
        return CallStatus.noAnswer;
      case 'cancelled':
        return CallStatus.cancelled;
      case 'completed':
        return CallStatus.completed;
      default:
        return CallStatus.connecting;
    }
  }

  @override
  String toString() {
    switch (this) {
      case CallStatus.connecting:
        return 'connecting';
      case CallStatus.ringing:
        return 'ringing';
      case CallStatus.connected:
        return 'connected';
      case CallStatus.missed:
        return 'missed';
      case CallStatus.noAnswer:
        return 'noAnswer';
      case CallStatus.cancelled:
        return 'cancelled';
      case CallStatus.completed:
        return 'completed';
    }
  }
}

enum CallType {
  voice,
  video;

  factory CallType.fromString(String status) {
    switch (status) {
      case 'voice':
        return CallType.voice;
      case 'video':
        return CallType.video;
      default:
        return CallType.voice;
    }
  }

  @override
  String toString() {
    switch (this) {
      case CallType.voice:
        return 'voice';
      case CallType.video:
        return 'video';
    }
  }
}

enum CallDirection {
  incoming,
  outgoing;

  factory CallDirection.fromString(String status) {
    switch (status) {
      case 'incoming':
        return CallDirection.incoming;
      case 'outgoing':
        return CallDirection.outgoing;
      default:
        return CallDirection.incoming;
    }
  }

  @override
  String toString() {
    switch (this) {
      case CallDirection.incoming:
        return 'incoming';
      case CallDirection.outgoing:
        return 'outgoing';
    }
  }
}


class ZenCall {
  String? callId;
  DateTime? callDuration;
  DateTime? callEndTime;
  CallType callType;
  CallStatus callStatus;
  CallDirection callDirection;

  ZenCall({this.callId,
    this.callType = CallType.voice,
    this.callStatus = CallStatus.connecting,
    this.callDirection = CallDirection.incoming,
    this.callDuration,
    this.callEndTime});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ZenCall &&
        other.callId == callId &&
        other.callDuration == callDuration &&
        other.callEndTime == callEndTime &&
        other.callType == callType &&
        other.callStatus == callStatus &&
        other.callDirection == callDirection;
  }

  @override
  int get hashCode {
    return Object.hash(
      callId,
      callDuration,
      callEndTime,
      callType,
      callStatus,
      callDirection,
    );
  }



  @override
  String toString() {
    return "callId $callId, callDuration $callDuration, callDirection $callDirection, callType $callType, callStatus $callStatus";
  }

  Map<String, dynamic> toMap() {
    return {
      'callId': this.callId,
      'callDuration': this.callDuration,
      'callEndTime': this.callEndTime,
      'callType': this.callType,
      'callStatus': this.callStatus,
      'callDirection': this.callDirection,
    };
  }

  factory ZenCall.fromMap(Map<String, dynamic> map) {
    return ZenCall(
      callId: map['callId'] as String,
      callDuration: map['callDuration'] as DateTime,
      callEndTime: map['callEndTime'] as DateTime,
      callType: map['callType'] as CallType,
      callStatus: map['callStatus'] as CallStatus,
      callDirection: map['callDirection'] as CallDirection,
    );
  }
}

