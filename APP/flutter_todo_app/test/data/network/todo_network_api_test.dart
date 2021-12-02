import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/data/models/network/todo_item.dart';
import 'package:flutter_todo_app/data/models/network/todo_result.dart';
import 'package:flutter_todo_app/data/network/todo_network_api.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'todo_network_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  String fixtures(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();
  late MockClient mockClient;
  late TodoNetworkApi todoNetworkApi;

  setUp(() {
    mockClient = MockClient();
    todoNetworkApi = TodoNetworkApi(mockClient);
  });

  group('getAllTodo', () {
    test('throws an error if not 200 status code', () {
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('', 500));

      expect(() => todoNetworkApi.getAllTodo(),
          throwsA(TypeMatcher<TodoNetworkApiException>()));
    });
    test('returns list of todo when http calls completed', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
          fixtures('get_all_todo_result'),
          200,
          headers: {'Accept': 'application/json'},
        ),
      );

      final todos = await todoNetworkApi.getAllTodo();

      expect(todos, TypeMatcher<TodoResult>());
      expect(todos?.data.length, 6);
      expect(todos?.data[0].id, 1);
      expect(todos?.data[0].title, startsWith('Learn Unity'));
    });
  });
}
