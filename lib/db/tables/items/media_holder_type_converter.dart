import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:driftexample/db/tables/items/media_holder.dart';
import 'package:flutter/cupertino.dart';

class MessageMediaHolderTypeConverter
    extends TypeConverter<List<MessageMediaHolder>, String> {
  const MessageMediaHolderTypeConverter();

  @override
  List<MessageMediaHolder> fromSql(String fromDb) {
    try {
      final List<dynamic> jsonDecoded = json.decode(fromDb);
      return jsonDecoded.map((re) => MessageMediaHolder.fromMap(re as Map<String, dynamic>)).toList();
    } catch (e) {
      debugPrint("Error decoding MessageMediaHolder from JSON: $e");
      return []; // Return empty list in case of failure
    }
  }

  @override
  String toSql(List<MessageMediaHolder> value) {
    final jsonValue = value.map((re) => re.toMap()).toList();
    return json.encode(jsonValue);
  }
}
