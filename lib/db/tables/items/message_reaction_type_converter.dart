import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:driftexample/db/tables/items/chat_message_model.dart';
import 'package:driftexample/db/tables/items/message_reactions.dart';
import 'package:flutter/cupertino.dart';

class MessageReactionTypeConverter
    extends TypeConverter<List<MessageReaction>, String> {
  const MessageReactionTypeConverter();

  @override
  List<MessageReaction> fromSql(String fromDb) {
    try {
      final List<dynamic> jsonDecoded = json.decode(fromDb);
      return jsonDecoded.map((re) => MessageReaction.fromMap(re as Map<String, dynamic>)).toList();
    } catch (e) {
      debugPrint("Error decoding MessageMediaHolder from JSON: $e");
      return []; // Return empty list in case of failure
    }
  }

  @override
  String toSql(List<MessageReaction> value) {
    final jsonValue = value.map((re) => re.toMap()).toList();
    return json.encode(jsonValue);
  }
}

class ZenCallTypeConverter
    extends NullAwareTypeConverter<ZenCall?, String> {
  const ZenCallTypeConverter();


  @override
  String toSql(ZenCall? value) {
    return json.encode(value?.toMap());
  }

  @override
  ZenCall? requireFromSql(String fromDb) {
    try {
      final  jsonDecoded = json.decode(fromDb);
      return ZenCall.fromMap(jsonDecoded);
    } catch (e) {
      debugPrint("Error decoding MessageMediaHolder from JSON: $e");
      return null; // Return empty list in case of failure
    }
  }

  @override
  String requireToSql(ZenCall? value) {
    return json.encode(value?.toMap());
  }
}
