library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_todo_app/data/models/network/todo_item.dart';
import 'package:flutter_todo_app/data/models/network/todo_result.dart';

part 'serializers.g.dart';

@SerializersFor(const [TodoResult, TodoItem])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
