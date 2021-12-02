library todo_result;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_todo_app/data/models/network/serializers.dart';
import 'package:flutter_todo_app/data/models/network/todo_item.dart';

part 'todo_result.g.dart';

abstract class TodoResult implements Built<TodoResult, TodoResultBuilder> {
  // fields go here
  bool get success;
  BuiltList<TodoItem> get data;

  TodoResult._();

  factory TodoResult([updates(TodoResultBuilder b)]) = _$TodoResult;

  String toJson() {
    return json.encode(serializers.serializeWith(TodoResult.serializer, this));
  }

  static TodoResult? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TodoResult.serializer, json.decode(jsonString));
  }

  static Serializer<TodoResult> get serializer => _$todoResultSerializer;
}
