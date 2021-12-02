// GENERATED CODE - DO NOT MODIFY BY HAND

part of todo_result;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TodoResult> _$todoResultSerializer = new _$TodoResultSerializer();

class _$TodoResultSerializer implements StructuredSerializer<TodoResult> {
  @override
  final Iterable<Type> types = const [TodoResult, _$TodoResult];
  @override
  final String wireName = 'TodoResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, TodoResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TodoItem)])),
    ];

    return result;
  }

  @override
  TodoResult deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodoResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TodoItem)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TodoResult extends TodoResult {
  @override
  final bool success;
  @override
  final BuiltList<TodoItem> data;

  factory _$TodoResult([void Function(TodoResultBuilder)? updates]) =>
      (new TodoResultBuilder()..update(updates)).build();

  _$TodoResult._({required this.success, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, 'TodoResult', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'TodoResult', 'data');
  }

  @override
  TodoResult rebuild(void Function(TodoResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoResultBuilder toBuilder() => new TodoResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodoResult &&
        success == other.success &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, success.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodoResult')
          ..add('success', success)
          ..add('data', data))
        .toString();
  }
}

class TodoResultBuilder implements Builder<TodoResult, TodoResultBuilder> {
  _$TodoResult? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<TodoItem>? _data;
  ListBuilder<TodoItem> get data =>
      _$this._data ??= new ListBuilder<TodoItem>();
  set data(ListBuilder<TodoItem>? data) => _$this._data = data;

  TodoResultBuilder();

  TodoResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodoResult;
  }

  @override
  void update(void Function(TodoResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TodoResult build() {
    _$TodoResult _$result;
    try {
      _$result = _$v ??
          new _$TodoResult._(
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'TodoResult', 'success'),
              data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TodoResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
