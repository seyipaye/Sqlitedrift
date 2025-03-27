// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, name, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String email;
  const User({required this.id, required this.name, required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
    };
  }

  User copyWith({int? id, String? name, String? email}) => User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
  })  : name = Value(name),
        email = Value(email);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? email}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $ChatMessagesEntityTable extends ChatMessagesEntity
    with TableInfo<$ChatMessagesEntityTable, ChatMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatMessagesEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageIdMeta =
      const VerificationMeta('messageId');
  @override
  late final GeneratedColumn<String> messageId = GeneratedColumn<String>(
      'message_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
      'room_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keyBundleMeta =
      const VerificationMeta('keyBundle');
  @override
  late final GeneratedColumn<String> keyBundle = GeneratedColumn<String>(
      'key_bundle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _newMessageMeta =
      const VerificationMeta('newMessage');
  @override
  late final GeneratedColumn<String> newMessage = GeneratedColumn<String>(
      'new_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<ZenCall?, String> zenCall =
      GeneratedColumn<String>('zen_call', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<ZenCall?>($ChatMessagesEntityTable.$converterzenCall);
  static const VerificationMeta _isForwardedMeta =
      const VerificationMeta('isForwarded');
  @override
  late final GeneratedColumn<bool> isForwarded = GeneratedColumn<bool>(
      'is_forwarded', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_forwarded" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      localFilePath = GeneratedColumn<String>(
              'local_file_path', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $ChatMessagesEntityTable.$converterlocalFilePathn);
  @override
  late final GeneratedColumnWithTypeConverter<List<MessageMediaHolder>?, String>
      medias = GeneratedColumn<String>('medias', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<MessageMediaHolder>?>(
              $ChatMessagesEntityTable.$convertermediasn);
  static const VerificationMeta _senderIdMeta =
      const VerificationMeta('senderId');
  @override
  late final GeneratedColumn<String> senderId = GeneratedColumn<String>(
      'sender_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sentAtMeta = const VerificationMeta('sentAt');
  @override
  late final GeneratedColumn<DateTime> sentAt = GeneratedColumn<DateTime>(
      'sent_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deliveredAtMeta =
      const VerificationMeta('deliveredAt');
  @override
  late final GeneratedColumn<DateTime> deliveredAt = GeneratedColumn<DateTime>(
      'delivered_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _readAtMeta = const VerificationMeta('readAt');
  @override
  late final GeneratedColumn<DateTime> readAt = GeneratedColumn<DateTime>(
      'read_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> readBy =
      GeneratedColumn<String>('read_by', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $ChatMessagesEntityTable.$converterreadBy);
  static const VerificationMeta _distributionKeyMeta =
      const VerificationMeta('distributionKey');
  @override
  late final GeneratedColumn<String> distributionKey = GeneratedColumn<String>(
      'distribution_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _senderNameMeta =
      const VerificationMeta('senderName');
  @override
  late final GeneratedColumn<String> senderName = GeneratedColumn<String>(
      'sender_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _isDownloadingMeta =
      const VerificationMeta('isDownloading');
  @override
  late final GeneratedColumn<bool> isDownloading = GeneratedColumn<bool>(
      'is_downloading', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_downloading" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _messageCreatedMeta =
      const VerificationMeta('messageCreated');
  @override
  late final GeneratedColumn<String> messageCreated = GeneratedColumn<String>(
      'message_created', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _decryptedMeta =
      const VerificationMeta('decrypted');
  @override
  late final GeneratedColumn<bool> decrypted = GeneratedColumn<bool>(
      'decrypted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("decrypted" IN (0, 1))'));
  static const VerificationMeta _repliedMessageIdMeta =
      const VerificationMeta('repliedMessageId');
  @override
  late final GeneratedColumn<String> repliedMessageId = GeneratedColumn<String>(
      'replied_message_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _messageTypeMeta =
      const VerificationMeta('messageType');
  @override
  late final GeneratedColumn<String> messageType = GeneratedColumn<String>(
      'message_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      documentUrls = GeneratedColumn<String>('document_urls', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $ChatMessagesEntityTable.$converterdocumentUrlsn);
  static const VerificationMeta _deletedForMeMeta =
      const VerificationMeta('deletedForMe');
  @override
  late final GeneratedColumn<bool> deletedForMe = GeneratedColumn<bool>(
      'deleted_for_me', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("deleted_for_me" IN (0, 1))'));
  @override
  late final GeneratedColumnWithTypeConverter<List<MessageReaction>?, String>
      reactions = GeneratedColumn<String>('reactions', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<MessageReaction>?>(
              $ChatMessagesEntityTable.$converterreactionsn);
  @override
  late final GeneratedColumnWithTypeConverter<MessageStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MessageStatus>(
              $ChatMessagesEntityTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns => [
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
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_messages_entity';
  @override
  VerificationContext validateIntegrity(Insertable<ChatMessage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('message_id')) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta));
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('key_bundle')) {
      context.handle(_keyBundleMeta,
          keyBundle.isAcceptableOrUnknown(data['key_bundle']!, _keyBundleMeta));
    }
    if (data.containsKey('new_message')) {
      context.handle(
          _newMessageMeta,
          newMessage.isAcceptableOrUnknown(
              data['new_message']!, _newMessageMeta));
    }
    if (data.containsKey('is_forwarded')) {
      context.handle(
          _isForwardedMeta,
          isForwarded.isAcceptableOrUnknown(
              data['is_forwarded']!, _isForwardedMeta));
    }
    if (data.containsKey('sender_id')) {
      context.handle(_senderIdMeta,
          senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta));
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('sent_at')) {
      context.handle(_sentAtMeta,
          sentAt.isAcceptableOrUnknown(data['sent_at']!, _sentAtMeta));
    }
    if (data.containsKey('delivered_at')) {
      context.handle(
          _deliveredAtMeta,
          deliveredAt.isAcceptableOrUnknown(
              data['delivered_at']!, _deliveredAtMeta));
    }
    if (data.containsKey('read_at')) {
      context.handle(_readAtMeta,
          readAt.isAcceptableOrUnknown(data['read_at']!, _readAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('distribution_key')) {
      context.handle(
          _distributionKeyMeta,
          distributionKey.isAcceptableOrUnknown(
              data['distribution_key']!, _distributionKeyMeta));
    }
    if (data.containsKey('sender_name')) {
      context.handle(
          _senderNameMeta,
          senderName.isAcceptableOrUnknown(
              data['sender_name']!, _senderNameMeta));
    } else if (isInserting) {
      context.missing(_senderNameMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('is_downloading')) {
      context.handle(
          _isDownloadingMeta,
          isDownloading.isAcceptableOrUnknown(
              data['is_downloading']!, _isDownloadingMeta));
    }
    if (data.containsKey('message_created')) {
      context.handle(
          _messageCreatedMeta,
          messageCreated.isAcceptableOrUnknown(
              data['message_created']!, _messageCreatedMeta));
    } else if (isInserting) {
      context.missing(_messageCreatedMeta);
    }
    if (data.containsKey('decrypted')) {
      context.handle(_decryptedMeta,
          decrypted.isAcceptableOrUnknown(data['decrypted']!, _decryptedMeta));
    }
    if (data.containsKey('replied_message_id')) {
      context.handle(
          _repliedMessageIdMeta,
          repliedMessageId.isAcceptableOrUnknown(
              data['replied_message_id']!, _repliedMessageIdMeta));
    }
    if (data.containsKey('message_type')) {
      context.handle(
          _messageTypeMeta,
          messageType.isAcceptableOrUnknown(
              data['message_type']!, _messageTypeMeta));
    } else if (isInserting) {
      context.missing(_messageTypeMeta);
    }
    if (data.containsKey('deleted_for_me')) {
      context.handle(
          _deletedForMeMeta,
          deletedForMe.isAcceptableOrUnknown(
              data['deleted_for_me']!, _deletedForMeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatMessage(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      keyBundle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key_bundle']),
      documentUrls: $ChatMessagesEntityTable.$converterdocumentUrlsn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}document_urls'])),
      deletedForMe: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted_for_me']),
      isForwarded: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_forwarded'])!,
      messageType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_type'])!,
      repliedMessageId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}replied_message_id']),
      messageId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_id'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_id'])!,
      newMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}new_message']),
      zenCall: $ChatMessagesEntityTable.$converterzenCall.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}zen_call'])),
      localFilePath: $ChatMessagesEntityTable.$converterlocalFilePathn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}local_file_path'])),
      senderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender_id'])!,
      sentAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sent_at']),
      deliveredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}delivered_at']),
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}progress'])!,
      isDownloading: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_downloading'])!,
      readAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}read_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      readBy: $ChatMessagesEntityTable.$converterreadBy.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}read_by'])!),
      distributionKey: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}distribution_key']),
      senderName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender_name'])!,
      status: $ChatMessagesEntityTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      messageCreated: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}message_created'])!,
      decrypted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}decrypted']),
      reactions: $ChatMessagesEntityTable.$converterreactionsn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}reactions'])),
      medias: $ChatMessagesEntityTable.$convertermediasn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}medias'])),
    );
  }

  @override
  $ChatMessagesEntityTable createAlias(String alias) {
    return $ChatMessagesEntityTable(attachedDatabase, alias);
  }

  static TypeConverter<ZenCall?, String?> $converterzenCall =
      const ZenCallTypeConverter();
  static TypeConverter<List<String>, String> $converterlocalFilePath =
      const ListToTextConverter();
  static TypeConverter<List<String>?, String?> $converterlocalFilePathn =
      NullAwareTypeConverter.wrap($converterlocalFilePath);
  static TypeConverter<List<MessageMediaHolder>, String> $convertermedias =
      const MessageMediaHolderTypeConverter();
  static TypeConverter<List<MessageMediaHolder>?, String?> $convertermediasn =
      NullAwareTypeConverter.wrap($convertermedias);
  static TypeConverter<List<String>, String> $converterreadBy =
      const ListToTextConverter();
  static TypeConverter<List<String>, String> $converterdocumentUrls =
      const ListToTextConverter();
  static TypeConverter<List<String>?, String?> $converterdocumentUrlsn =
      NullAwareTypeConverter.wrap($converterdocumentUrls);
  static TypeConverter<List<MessageReaction>, String> $converterreactions =
      const MessageReactionTypeConverter();
  static TypeConverter<List<MessageReaction>?, String?> $converterreactionsn =
      NullAwareTypeConverter.wrap($converterreactions);
  static JsonTypeConverter2<MessageStatus, String, String> $converterstatus =
      const EnumNameConverter<MessageStatus>(MessageStatus.values);
}

class ChatMessagesEntityCompanion extends UpdateCompanion<ChatMessage> {
  final Value<String> id;
  final Value<String> messageId;
  final Value<String> roomId;
  final Value<String?> keyBundle;
  final Value<String?> newMessage;
  final Value<ZenCall?> zenCall;
  final Value<bool> isForwarded;
  final Value<List<String>?> localFilePath;
  final Value<List<MessageMediaHolder>?> medias;
  final Value<String> senderId;
  final Value<DateTime?> sentAt;
  final Value<DateTime?> deliveredAt;
  final Value<DateTime?> readAt;
  final Value<DateTime> createdAt;
  final Value<bool> isDeleted;
  final Value<List<String>> readBy;
  final Value<String?> distributionKey;
  final Value<String> senderName;
  final Value<double> progress;
  final Value<bool> isDownloading;
  final Value<String> messageCreated;
  final Value<bool?> decrypted;
  final Value<String?> repliedMessageId;
  final Value<String> messageType;
  final Value<List<String>?> documentUrls;
  final Value<bool?> deletedForMe;
  final Value<List<MessageReaction>?> reactions;
  final Value<MessageStatus> status;
  final Value<int> rowid;
  const ChatMessagesEntityCompanion({
    this.id = const Value.absent(),
    this.messageId = const Value.absent(),
    this.roomId = const Value.absent(),
    this.keyBundle = const Value.absent(),
    this.newMessage = const Value.absent(),
    this.zenCall = const Value.absent(),
    this.isForwarded = const Value.absent(),
    this.localFilePath = const Value.absent(),
    this.medias = const Value.absent(),
    this.senderId = const Value.absent(),
    this.sentAt = const Value.absent(),
    this.deliveredAt = const Value.absent(),
    this.readAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.readBy = const Value.absent(),
    this.distributionKey = const Value.absent(),
    this.senderName = const Value.absent(),
    this.progress = const Value.absent(),
    this.isDownloading = const Value.absent(),
    this.messageCreated = const Value.absent(),
    this.decrypted = const Value.absent(),
    this.repliedMessageId = const Value.absent(),
    this.messageType = const Value.absent(),
    this.documentUrls = const Value.absent(),
    this.deletedForMe = const Value.absent(),
    this.reactions = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChatMessagesEntityCompanion.insert({
    required String id,
    required String messageId,
    required String roomId,
    this.keyBundle = const Value.absent(),
    this.newMessage = const Value.absent(),
    this.zenCall = const Value.absent(),
    this.isForwarded = const Value.absent(),
    this.localFilePath = const Value.absent(),
    this.medias = const Value.absent(),
    required String senderId,
    this.sentAt = const Value.absent(),
    this.deliveredAt = const Value.absent(),
    this.readAt = const Value.absent(),
    required DateTime createdAt,
    this.isDeleted = const Value.absent(),
    required List<String> readBy,
    this.distributionKey = const Value.absent(),
    required String senderName,
    this.progress = const Value.absent(),
    this.isDownloading = const Value.absent(),
    required String messageCreated,
    this.decrypted = const Value.absent(),
    this.repliedMessageId = const Value.absent(),
    required String messageType,
    this.documentUrls = const Value.absent(),
    this.deletedForMe = const Value.absent(),
    this.reactions = const Value.absent(),
    required MessageStatus status,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        messageId = Value(messageId),
        roomId = Value(roomId),
        senderId = Value(senderId),
        createdAt = Value(createdAt),
        readBy = Value(readBy),
        senderName = Value(senderName),
        messageCreated = Value(messageCreated),
        messageType = Value(messageType),
        status = Value(status);
  static Insertable<ChatMessage> custom({
    Expression<String>? id,
    Expression<String>? messageId,
    Expression<String>? roomId,
    Expression<String>? keyBundle,
    Expression<String>? newMessage,
    Expression<String>? zenCall,
    Expression<bool>? isForwarded,
    Expression<String>? localFilePath,
    Expression<String>? medias,
    Expression<String>? senderId,
    Expression<DateTime>? sentAt,
    Expression<DateTime>? deliveredAt,
    Expression<DateTime>? readAt,
    Expression<DateTime>? createdAt,
    Expression<bool>? isDeleted,
    Expression<String>? readBy,
    Expression<String>? distributionKey,
    Expression<String>? senderName,
    Expression<double>? progress,
    Expression<bool>? isDownloading,
    Expression<String>? messageCreated,
    Expression<bool>? decrypted,
    Expression<String>? repliedMessageId,
    Expression<String>? messageType,
    Expression<String>? documentUrls,
    Expression<bool>? deletedForMe,
    Expression<String>? reactions,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messageId != null) 'message_id': messageId,
      if (roomId != null) 'room_id': roomId,
      if (keyBundle != null) 'key_bundle': keyBundle,
      if (newMessage != null) 'new_message': newMessage,
      if (zenCall != null) 'zen_call': zenCall,
      if (isForwarded != null) 'is_forwarded': isForwarded,
      if (localFilePath != null) 'local_file_path': localFilePath,
      if (medias != null) 'medias': medias,
      if (senderId != null) 'sender_id': senderId,
      if (sentAt != null) 'sent_at': sentAt,
      if (deliveredAt != null) 'delivered_at': deliveredAt,
      if (readAt != null) 'read_at': readAt,
      if (createdAt != null) 'created_at': createdAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (readBy != null) 'read_by': readBy,
      if (distributionKey != null) 'distribution_key': distributionKey,
      if (senderName != null) 'sender_name': senderName,
      if (progress != null) 'progress': progress,
      if (isDownloading != null) 'is_downloading': isDownloading,
      if (messageCreated != null) 'message_created': messageCreated,
      if (decrypted != null) 'decrypted': decrypted,
      if (repliedMessageId != null) 'replied_message_id': repliedMessageId,
      if (messageType != null) 'message_type': messageType,
      if (documentUrls != null) 'document_urls': documentUrls,
      if (deletedForMe != null) 'deleted_for_me': deletedForMe,
      if (reactions != null) 'reactions': reactions,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChatMessagesEntityCompanion copyWith(
      {Value<String>? id,
      Value<String>? messageId,
      Value<String>? roomId,
      Value<String?>? keyBundle,
      Value<String?>? newMessage,
      Value<ZenCall?>? zenCall,
      Value<bool>? isForwarded,
      Value<List<String>?>? localFilePath,
      Value<List<MessageMediaHolder>?>? medias,
      Value<String>? senderId,
      Value<DateTime?>? sentAt,
      Value<DateTime?>? deliveredAt,
      Value<DateTime?>? readAt,
      Value<DateTime>? createdAt,
      Value<bool>? isDeleted,
      Value<List<String>>? readBy,
      Value<String?>? distributionKey,
      Value<String>? senderName,
      Value<double>? progress,
      Value<bool>? isDownloading,
      Value<String>? messageCreated,
      Value<bool?>? decrypted,
      Value<String?>? repliedMessageId,
      Value<String>? messageType,
      Value<List<String>?>? documentUrls,
      Value<bool?>? deletedForMe,
      Value<List<MessageReaction>?>? reactions,
      Value<MessageStatus>? status,
      Value<int>? rowid}) {
    return ChatMessagesEntityCompanion(
      id: id ?? this.id,
      messageId: messageId ?? this.messageId,
      roomId: roomId ?? this.roomId,
      keyBundle: keyBundle ?? this.keyBundle,
      newMessage: newMessage ?? this.newMessage,
      zenCall: zenCall ?? this.zenCall,
      isForwarded: isForwarded ?? this.isForwarded,
      localFilePath: localFilePath ?? this.localFilePath,
      medias: medias ?? this.medias,
      senderId: senderId ?? this.senderId,
      sentAt: sentAt ?? this.sentAt,
      deliveredAt: deliveredAt ?? this.deliveredAt,
      readAt: readAt ?? this.readAt,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
      readBy: readBy ?? this.readBy,
      distributionKey: distributionKey ?? this.distributionKey,
      senderName: senderName ?? this.senderName,
      progress: progress ?? this.progress,
      isDownloading: isDownloading ?? this.isDownloading,
      messageCreated: messageCreated ?? this.messageCreated,
      decrypted: decrypted ?? this.decrypted,
      repliedMessageId: repliedMessageId ?? this.repliedMessageId,
      messageType: messageType ?? this.messageType,
      documentUrls: documentUrls ?? this.documentUrls,
      deletedForMe: deletedForMe ?? this.deletedForMe,
      reactions: reactions ?? this.reactions,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messageId.present) {
      map['message_id'] = Variable<String>(messageId.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (keyBundle.present) {
      map['key_bundle'] = Variable<String>(keyBundle.value);
    }
    if (newMessage.present) {
      map['new_message'] = Variable<String>(newMessage.value);
    }
    if (zenCall.present) {
      map['zen_call'] = Variable<String>(
          $ChatMessagesEntityTable.$converterzenCall.toSql(zenCall.value));
    }
    if (isForwarded.present) {
      map['is_forwarded'] = Variable<bool>(isForwarded.value);
    }
    if (localFilePath.present) {
      map['local_file_path'] = Variable<String>($ChatMessagesEntityTable
          .$converterlocalFilePathn
          .toSql(localFilePath.value));
    }
    if (medias.present) {
      map['medias'] = Variable<String>(
          $ChatMessagesEntityTable.$convertermediasn.toSql(medias.value));
    }
    if (senderId.present) {
      map['sender_id'] = Variable<String>(senderId.value);
    }
    if (sentAt.present) {
      map['sent_at'] = Variable<DateTime>(sentAt.value);
    }
    if (deliveredAt.present) {
      map['delivered_at'] = Variable<DateTime>(deliveredAt.value);
    }
    if (readAt.present) {
      map['read_at'] = Variable<DateTime>(readAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (readBy.present) {
      map['read_by'] = Variable<String>(
          $ChatMessagesEntityTable.$converterreadBy.toSql(readBy.value));
    }
    if (distributionKey.present) {
      map['distribution_key'] = Variable<String>(distributionKey.value);
    }
    if (senderName.present) {
      map['sender_name'] = Variable<String>(senderName.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (isDownloading.present) {
      map['is_downloading'] = Variable<bool>(isDownloading.value);
    }
    if (messageCreated.present) {
      map['message_created'] = Variable<String>(messageCreated.value);
    }
    if (decrypted.present) {
      map['decrypted'] = Variable<bool>(decrypted.value);
    }
    if (repliedMessageId.present) {
      map['replied_message_id'] = Variable<String>(repliedMessageId.value);
    }
    if (messageType.present) {
      map['message_type'] = Variable<String>(messageType.value);
    }
    if (documentUrls.present) {
      map['document_urls'] = Variable<String>($ChatMessagesEntityTable
          .$converterdocumentUrlsn
          .toSql(documentUrls.value));
    }
    if (deletedForMe.present) {
      map['deleted_for_me'] = Variable<bool>(deletedForMe.value);
    }
    if (reactions.present) {
      map['reactions'] = Variable<String>(
          $ChatMessagesEntityTable.$converterreactionsn.toSql(reactions.value));
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $ChatMessagesEntityTable.$converterstatus.toSql(status.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessagesEntityCompanion(')
          ..write('id: $id, ')
          ..write('messageId: $messageId, ')
          ..write('roomId: $roomId, ')
          ..write('keyBundle: $keyBundle, ')
          ..write('newMessage: $newMessage, ')
          ..write('zenCall: $zenCall, ')
          ..write('isForwarded: $isForwarded, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('medias: $medias, ')
          ..write('senderId: $senderId, ')
          ..write('sentAt: $sentAt, ')
          ..write('deliveredAt: $deliveredAt, ')
          ..write('readAt: $readAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('readBy: $readBy, ')
          ..write('distributionKey: $distributionKey, ')
          ..write('senderName: $senderName, ')
          ..write('progress: $progress, ')
          ..write('isDownloading: $isDownloading, ')
          ..write('messageCreated: $messageCreated, ')
          ..write('decrypted: $decrypted, ')
          ..write('repliedMessageId: $repliedMessageId, ')
          ..write('messageType: $messageType, ')
          ..write('documentUrls: $documentUrls, ')
          ..write('deletedForMe: $deletedForMe, ')
          ..write('reactions: $reactions, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ChatMessagesEntityTable chatMessagesEntity =
      $ChatMessagesEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, chatMessagesEntity];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String name,
  required String email,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> email,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            email: email,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String email,
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            email: email,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$ChatMessagesEntityTableCreateCompanionBuilder
    = ChatMessagesEntityCompanion Function({
  required String id,
  required String messageId,
  required String roomId,
  Value<String?> keyBundle,
  Value<String?> newMessage,
  Value<ZenCall?> zenCall,
  Value<bool> isForwarded,
  Value<List<String>?> localFilePath,
  Value<List<MessageMediaHolder>?> medias,
  required String senderId,
  Value<DateTime?> sentAt,
  Value<DateTime?> deliveredAt,
  Value<DateTime?> readAt,
  required DateTime createdAt,
  Value<bool> isDeleted,
  required List<String> readBy,
  Value<String?> distributionKey,
  required String senderName,
  Value<double> progress,
  Value<bool> isDownloading,
  required String messageCreated,
  Value<bool?> decrypted,
  Value<String?> repliedMessageId,
  required String messageType,
  Value<List<String>?> documentUrls,
  Value<bool?> deletedForMe,
  Value<List<MessageReaction>?> reactions,
  required MessageStatus status,
  Value<int> rowid,
});
typedef $$ChatMessagesEntityTableUpdateCompanionBuilder
    = ChatMessagesEntityCompanion Function({
  Value<String> id,
  Value<String> messageId,
  Value<String> roomId,
  Value<String?> keyBundle,
  Value<String?> newMessage,
  Value<ZenCall?> zenCall,
  Value<bool> isForwarded,
  Value<List<String>?> localFilePath,
  Value<List<MessageMediaHolder>?> medias,
  Value<String> senderId,
  Value<DateTime?> sentAt,
  Value<DateTime?> deliveredAt,
  Value<DateTime?> readAt,
  Value<DateTime> createdAt,
  Value<bool> isDeleted,
  Value<List<String>> readBy,
  Value<String?> distributionKey,
  Value<String> senderName,
  Value<double> progress,
  Value<bool> isDownloading,
  Value<String> messageCreated,
  Value<bool?> decrypted,
  Value<String?> repliedMessageId,
  Value<String> messageType,
  Value<List<String>?> documentUrls,
  Value<bool?> deletedForMe,
  Value<List<MessageReaction>?> reactions,
  Value<MessageStatus> status,
  Value<int> rowid,
});

class $$ChatMessagesEntityTableFilterComposer
    extends Composer<_$AppDatabase, $ChatMessagesEntityTable> {
  $$ChatMessagesEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get messageId => $composableBuilder(
      column: $table.messageId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roomId => $composableBuilder(
      column: $table.roomId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keyBundle => $composableBuilder(
      column: $table.keyBundle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get newMessage => $composableBuilder(
      column: $table.newMessage, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ZenCall?, ZenCall, String> get zenCall =>
      $composableBuilder(
          column: $table.zenCall,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isForwarded => $composableBuilder(
      column: $table.isForwarded, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get localFilePath => $composableBuilder(
          column: $table.localFilePath,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<MessageMediaHolder>?,
          List<MessageMediaHolder>, String>
      get medias => $composableBuilder(
          column: $table.medias,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get senderId => $composableBuilder(
      column: $table.senderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get sentAt => $composableBuilder(
      column: $table.sentAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deliveredAt => $composableBuilder(
      column: $table.deliveredAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get readAt => $composableBuilder(
      column: $table.readAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get readBy => $composableBuilder(
          column: $table.readBy,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get distributionKey => $composableBuilder(
      column: $table.distributionKey,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get senderName => $composableBuilder(
      column: $table.senderName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDownloading => $composableBuilder(
      column: $table.isDownloading, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get messageCreated => $composableBuilder(
      column: $table.messageCreated,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get decrypted => $composableBuilder(
      column: $table.decrypted, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get repliedMessageId => $composableBuilder(
      column: $table.repliedMessageId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get messageType => $composableBuilder(
      column: $table.messageType, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get documentUrls => $composableBuilder(
          column: $table.documentUrls,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get deletedForMe => $composableBuilder(
      column: $table.deletedForMe, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<MessageReaction>?, List<MessageReaction>,
          String>
      get reactions => $composableBuilder(
          column: $table.reactions,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<MessageStatus, MessageStatus, String>
      get status => $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$ChatMessagesEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatMessagesEntityTable> {
  $$ChatMessagesEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get messageId => $composableBuilder(
      column: $table.messageId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roomId => $composableBuilder(
      column: $table.roomId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keyBundle => $composableBuilder(
      column: $table.keyBundle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get newMessage => $composableBuilder(
      column: $table.newMessage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get zenCall => $composableBuilder(
      column: $table.zenCall, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isForwarded => $composableBuilder(
      column: $table.isForwarded, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localFilePath => $composableBuilder(
      column: $table.localFilePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get medias => $composableBuilder(
      column: $table.medias, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get senderId => $composableBuilder(
      column: $table.senderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get sentAt => $composableBuilder(
      column: $table.sentAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deliveredAt => $composableBuilder(
      column: $table.deliveredAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get readAt => $composableBuilder(
      column: $table.readAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get readBy => $composableBuilder(
      column: $table.readBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get distributionKey => $composableBuilder(
      column: $table.distributionKey,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get senderName => $composableBuilder(
      column: $table.senderName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDownloading => $composableBuilder(
      column: $table.isDownloading,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get messageCreated => $composableBuilder(
      column: $table.messageCreated,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get decrypted => $composableBuilder(
      column: $table.decrypted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get repliedMessageId => $composableBuilder(
      column: $table.repliedMessageId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get messageType => $composableBuilder(
      column: $table.messageType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get documentUrls => $composableBuilder(
      column: $table.documentUrls,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deletedForMe => $composableBuilder(
      column: $table.deletedForMe,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reactions => $composableBuilder(
      column: $table.reactions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$ChatMessagesEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatMessagesEntityTable> {
  $$ChatMessagesEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get messageId =>
      $composableBuilder(column: $table.messageId, builder: (column) => column);

  GeneratedColumn<String> get roomId =>
      $composableBuilder(column: $table.roomId, builder: (column) => column);

  GeneratedColumn<String> get keyBundle =>
      $composableBuilder(column: $table.keyBundle, builder: (column) => column);

  GeneratedColumn<String> get newMessage => $composableBuilder(
      column: $table.newMessage, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ZenCall?, String> get zenCall =>
      $composableBuilder(column: $table.zenCall, builder: (column) => column);

  GeneratedColumn<bool> get isForwarded => $composableBuilder(
      column: $table.isForwarded, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get localFilePath =>
      $composableBuilder(
          column: $table.localFilePath, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<MessageMediaHolder>?, String>
      get medias => $composableBuilder(
          column: $table.medias, builder: (column) => column);

  GeneratedColumn<String> get senderId =>
      $composableBuilder(column: $table.senderId, builder: (column) => column);

  GeneratedColumn<DateTime> get sentAt =>
      $composableBuilder(column: $table.sentAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deliveredAt => $composableBuilder(
      column: $table.deliveredAt, builder: (column) => column);

  GeneratedColumn<DateTime> get readAt =>
      $composableBuilder(column: $table.readAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get readBy =>
      $composableBuilder(column: $table.readBy, builder: (column) => column);

  GeneratedColumn<String> get distributionKey => $composableBuilder(
      column: $table.distributionKey, builder: (column) => column);

  GeneratedColumn<String> get senderName => $composableBuilder(
      column: $table.senderName, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<bool> get isDownloading => $composableBuilder(
      column: $table.isDownloading, builder: (column) => column);

  GeneratedColumn<String> get messageCreated => $composableBuilder(
      column: $table.messageCreated, builder: (column) => column);

  GeneratedColumn<bool> get decrypted =>
      $composableBuilder(column: $table.decrypted, builder: (column) => column);

  GeneratedColumn<String> get repliedMessageId => $composableBuilder(
      column: $table.repliedMessageId, builder: (column) => column);

  GeneratedColumn<String> get messageType => $composableBuilder(
      column: $table.messageType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get documentUrls =>
      $composableBuilder(
          column: $table.documentUrls, builder: (column) => column);

  GeneratedColumn<bool> get deletedForMe => $composableBuilder(
      column: $table.deletedForMe, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<MessageReaction>?, String>
      get reactions => $composableBuilder(
          column: $table.reactions, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MessageStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$ChatMessagesEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChatMessagesEntityTable,
    ChatMessage,
    $$ChatMessagesEntityTableFilterComposer,
    $$ChatMessagesEntityTableOrderingComposer,
    $$ChatMessagesEntityTableAnnotationComposer,
    $$ChatMessagesEntityTableCreateCompanionBuilder,
    $$ChatMessagesEntityTableUpdateCompanionBuilder,
    (
      ChatMessage,
      BaseReferences<_$AppDatabase, $ChatMessagesEntityTable, ChatMessage>
    ),
    ChatMessage,
    PrefetchHooks Function()> {
  $$ChatMessagesEntityTableTableManager(
      _$AppDatabase db, $ChatMessagesEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatMessagesEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatMessagesEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatMessagesEntityTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> messageId = const Value.absent(),
            Value<String> roomId = const Value.absent(),
            Value<String?> keyBundle = const Value.absent(),
            Value<String?> newMessage = const Value.absent(),
            Value<ZenCall?> zenCall = const Value.absent(),
            Value<bool> isForwarded = const Value.absent(),
            Value<List<String>?> localFilePath = const Value.absent(),
            Value<List<MessageMediaHolder>?> medias = const Value.absent(),
            Value<String> senderId = const Value.absent(),
            Value<DateTime?> sentAt = const Value.absent(),
            Value<DateTime?> deliveredAt = const Value.absent(),
            Value<DateTime?> readAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<List<String>> readBy = const Value.absent(),
            Value<String?> distributionKey = const Value.absent(),
            Value<String> senderName = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<bool> isDownloading = const Value.absent(),
            Value<String> messageCreated = const Value.absent(),
            Value<bool?> decrypted = const Value.absent(),
            Value<String?> repliedMessageId = const Value.absent(),
            Value<String> messageType = const Value.absent(),
            Value<List<String>?> documentUrls = const Value.absent(),
            Value<bool?> deletedForMe = const Value.absent(),
            Value<List<MessageReaction>?> reactions = const Value.absent(),
            Value<MessageStatus> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChatMessagesEntityCompanion(
            id: id,
            messageId: messageId,
            roomId: roomId,
            keyBundle: keyBundle,
            newMessage: newMessage,
            zenCall: zenCall,
            isForwarded: isForwarded,
            localFilePath: localFilePath,
            medias: medias,
            senderId: senderId,
            sentAt: sentAt,
            deliveredAt: deliveredAt,
            readAt: readAt,
            createdAt: createdAt,
            isDeleted: isDeleted,
            readBy: readBy,
            distributionKey: distributionKey,
            senderName: senderName,
            progress: progress,
            isDownloading: isDownloading,
            messageCreated: messageCreated,
            decrypted: decrypted,
            repliedMessageId: repliedMessageId,
            messageType: messageType,
            documentUrls: documentUrls,
            deletedForMe: deletedForMe,
            reactions: reactions,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String messageId,
            required String roomId,
            Value<String?> keyBundle = const Value.absent(),
            Value<String?> newMessage = const Value.absent(),
            Value<ZenCall?> zenCall = const Value.absent(),
            Value<bool> isForwarded = const Value.absent(),
            Value<List<String>?> localFilePath = const Value.absent(),
            Value<List<MessageMediaHolder>?> medias = const Value.absent(),
            required String senderId,
            Value<DateTime?> sentAt = const Value.absent(),
            Value<DateTime?> deliveredAt = const Value.absent(),
            Value<DateTime?> readAt = const Value.absent(),
            required DateTime createdAt,
            Value<bool> isDeleted = const Value.absent(),
            required List<String> readBy,
            Value<String?> distributionKey = const Value.absent(),
            required String senderName,
            Value<double> progress = const Value.absent(),
            Value<bool> isDownloading = const Value.absent(),
            required String messageCreated,
            Value<bool?> decrypted = const Value.absent(),
            Value<String?> repliedMessageId = const Value.absent(),
            required String messageType,
            Value<List<String>?> documentUrls = const Value.absent(),
            Value<bool?> deletedForMe = const Value.absent(),
            Value<List<MessageReaction>?> reactions = const Value.absent(),
            required MessageStatus status,
            Value<int> rowid = const Value.absent(),
          }) =>
              ChatMessagesEntityCompanion.insert(
            id: id,
            messageId: messageId,
            roomId: roomId,
            keyBundle: keyBundle,
            newMessage: newMessage,
            zenCall: zenCall,
            isForwarded: isForwarded,
            localFilePath: localFilePath,
            medias: medias,
            senderId: senderId,
            sentAt: sentAt,
            deliveredAt: deliveredAt,
            readAt: readAt,
            createdAt: createdAt,
            isDeleted: isDeleted,
            readBy: readBy,
            distributionKey: distributionKey,
            senderName: senderName,
            progress: progress,
            isDownloading: isDownloading,
            messageCreated: messageCreated,
            decrypted: decrypted,
            repliedMessageId: repliedMessageId,
            messageType: messageType,
            documentUrls: documentUrls,
            deletedForMe: deletedForMe,
            reactions: reactions,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ChatMessagesEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ChatMessagesEntityTable,
    ChatMessage,
    $$ChatMessagesEntityTableFilterComposer,
    $$ChatMessagesEntityTableOrderingComposer,
    $$ChatMessagesEntityTableAnnotationComposer,
    $$ChatMessagesEntityTableCreateCompanionBuilder,
    $$ChatMessagesEntityTableUpdateCompanionBuilder,
    (
      ChatMessage,
      BaseReferences<_$AppDatabase, $ChatMessagesEntityTable, ChatMessage>
    ),
    ChatMessage,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ChatMessagesEntityTableTableManager get chatMessagesEntity =>
      $$ChatMessagesEntityTableTableManager(_db, _db.chatMessagesEntity);
}
