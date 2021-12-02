import 'package:flutter_todo_app/data/models/network/todo_result.dart';
import 'package:http/http.dart' as http;

const BASE_URL = 'http://localhost:8000';

class TodoNetworkApi {
  TodoNetworkApi(this._http);
  final http.Client _http;

  /// @route => /todo
  /// @method => GET
  /// @return => BuiltList<TodoItem>?
  Future<TodoResult?> getAllTodo() async {
    final response = await _http.get(Uri.parse(BASE_URL + '/todo'));

    if (response.statusCode != 200)
      throw TodoNetworkApiException('Bad request');

    return TodoResult.fromJson(response.body);
  }

  /// @route => /todo/{id}
  /// @method => GET
  /// @return => TodoItem

  /// @route => /todo
  /// @method => POST

  /// @route => /todo/{id}
  /// @method => PUT

  /// @route => /todo/{id}
  /// @method => DELETE
}

class TodoNetworkApiException implements Exception {
  final String message;
  TodoNetworkApiException(this.message);
}

class TodoNetworkApiNoTodo implements Exception {
  final String message;
  TodoNetworkApiNoTodo(this.message);
}
