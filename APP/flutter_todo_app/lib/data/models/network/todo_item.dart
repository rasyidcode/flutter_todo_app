library todo_item;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_todo_app/data/models/network/serializers.dart';

part 'todo_item.g.dart';

abstract class TodoItem implements Built<TodoItem, TodoItemBuilder> {
  int get id;
  String get title;
  String get desc;
  String get begin;
  String get end;
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;
  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  TodoItem._();

  factory TodoItem([updates(TodoItemBuilder b)]) = _$TodoItem;

  String toJson() {
    return json.encode(serializers.serializeWith(TodoItem.serializer, this));
  }

  static TodoItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TodoItem.serializer, json.decode(jsonString));
  }

  static Serializer<TodoItem> get serializer => _$todoItemSerializer;
}
