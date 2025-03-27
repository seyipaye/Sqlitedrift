import 'package:driftexample/db/tables/items/chat_message_model.dart';
import 'package:equatable/equatable.dart';

class MessageMediaHolder extends Equatable {
  final String? thumbNail;
  final String? media;
  final String? mediaId;
  final String? presignedUrlKey;
  final String? presignedUrl;
  final String? thumbnailpresignedUrlKey;
  final String? thumbnailpresignedUrl;

  final MessageStatus mediaStatus;

  final MessageMediaOrientation messageMediaOrientation;
  final String? duration;

  final MediaType mediatype;
  final String? fileSize;
  final String? width;
  final int? groupIndex;
  final String? groupId;
  final int? groupCount;
  final String? height;

  const MessageMediaHolder({this.thumbNail,
    this.messageMediaOrientation = MessageMediaOrientation.portrait,
    this.media,
    this.mediaId,
    this.presignedUrlKey,
    this.presignedUrl,
    this.thumbnailpresignedUrlKey,
    this.thumbnailpresignedUrl,
    this.mediatype = MediaType.unknown,
    this.duration,
    this.width,
    this.mediaStatus=MessageStatus.saved,
    this.groupIndex,
    this.groupId,
    this.groupCount,
    this.height,
    this.fileSize});

  Map<String, dynamic> toMap() {
    return {
      'thumbNail': thumbNail ?? "",
      'media': media ?? "",
      'height': height ?? "0",
      'presignedUrl': presignedUrl ?? "",
      'mediaId': mediaId ?? "",
      'presignedUrlKey': presignedUrlKey ?? "",
      'thumbnailpresignedUrl': thumbnailpresignedUrl ?? "",
      'thumbnailpresignedUrlKey': thumbnailpresignedUrlKey ?? "",
      if(groupId != null)'groupId': groupId,
      if(groupCount != null)'groupCount': groupCount.toString(),
      if(groupIndex != null)'groupIndex': groupIndex.toString(),
      'width': width ?? "0",
      'messageMediaOrientation': messageMediaOrientation.toString(),
      'duration': duration ?? "0",
      'mediaStatus': MessageStatus.saved.toString(),
      'mediatype': mediatype.toString(),
      'fileSize': fileSize ?? "",
    };
  }

  factory MessageMediaHolder.fromMap(Map<String, dynamic> map) {
    final mediatype = map['mediatype'];
    final orientation = map['messageMediaOrientation'];
    return MessageMediaHolder(
      thumbNail: map['thumbNail'] as String?,
      media: map['media'] as String?,
      messageMediaOrientation: orientation != null
          ? MessageMediaOrientation.fromString(orientation)
          : MessageMediaOrientation.portrait,
      duration: map['duration'] as String?,
      mediatype:
      mediatype != null ? MediaType.fromString(mediatype) : MediaType.image,
      fileSize: map['fileSize'] as String?,
      width: map['width'] as String?,
      mediaId: map['mediaId'] as String?,
      height: map['height'] as String?,
      presignedUrl: map['presignedUrl'] as String?,
      presignedUrlKey: map['presignedUrlKey'] as String?,
      thumbnailpresignedUrl: map['thumbnailpresignedUrl'] as String?,
      thumbnailpresignedUrlKey: map['thumbnailpresignedUrlKey'] as String?,
      groupId: map['groupId'] as String?,
      mediaStatus: MessageStatus.saved,
      groupCount: int.tryParse((map['groupCount'] as String?) ?? ""),
      groupIndex: int.tryParse((map['groupIndex'] as String?) ?? ""),
    );
  }

  MessageMediaHolder copyWith({
    String? thumbNail,
    String? media,
    String? width,
    String? height,
    int? index,
    int? count,
    String? groupId,
    MessageMediaOrientation? messageMediaOrientation,
    String? duration,
    MediaType? mediatype,
    String? fileSize,
    String? mediaId,
    String? presignedUrlKey,
    String? presignedUrl,
    String? thumbnailpresignedUrlKey,
    String? thumbnailpresignedUrl,
    MessageStatus? mediaStatus,
  }) {
    return MessageMediaHolder(
        thumbNail: thumbNail ?? this.thumbNail,
        media: media ?? this.media,
        duration: duration ?? this.duration,
        mediatype: mediatype ?? this.mediatype,
        width: width ?? this.width,
        mediaId: mediaId ?? this.mediaId,
        height: height ?? this.height,
        groupId: groupId ?? this.groupId,
        groupIndex: index ?? this.groupIndex,
        groupCount: count ?? this.groupCount,
        fileSize: fileSize ?? this.fileSize,
        presignedUrl: presignedUrl ?? this.presignedUrl,
        presignedUrlKey: presignedUrlKey ?? this.presignedUrlKey,
        thumbnailpresignedUrlKey: thumbnailpresignedUrlKey ??
            this.thumbnailpresignedUrlKey,
        thumbnailpresignedUrl: thumbnailpresignedUrl ??
            this.thumbnailpresignedUrl,
        mediaStatus: mediaStatus ?? this.mediaStatus,
        messageMediaOrientation:
        messageMediaOrientation ?? this.messageMediaOrientation);
  }

  bool isPotrait() {
    return messageMediaOrientation == MessageMediaOrientation.portrait;
  }

  @override
  String toString() {
    return 'MessageMediaHolder{thumbNail: $thumbNail, id: $mediaId media: $media, presignedUrlKey: $presignedUrlKey, presignedUrl: $presignedUrl, thumbnailpresignedUrlKey: $thumbnailpresignedUrlKey, thumbnailpresignedUrl: $thumbnailpresignedUrl, mediaStatus: $mediaStatus, messageMediaOrientation: $messageMediaOrientation, duration: $duration, mediatype: $mediatype, fileSize: $fileSize, width: $width, groupIndex: $groupIndex, groupId: $groupId, groupCount: $groupCount, height: $height}';
  }


  @override
  List<Object?> get props =>
      [
        thumbNail,
        media,
        mediaId,
        presignedUrlKey,
        presignedUrl,
        thumbnailpresignedUrlKey,
        thumbnailpresignedUrl,
        mediaStatus,
        messageMediaOrientation,
        duration,
        mediatype,
        fileSize,
        width,
        groupIndex,
        groupId,
        groupCount,
        height,
      ];

  String getFile() {
    final mediaFile = media;
    final mediaFileThumb = thumbNail;
    final file =
        (mediaFile ) ?? "";
    return file;
  }

  String getThumbFile() {
    final mediaFileThumb = thumbNail;
    final file =
        (mediaFileThumb ) ?? "";
    return file;
  }

  bool isVideo() {
    return mediatype == MediaType.video;
  }

  bool isImageOrVideo() {
    return mediatype==MediaType.image || mediatype==MediaType.video;
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