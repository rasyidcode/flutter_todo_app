// GENERATED CODE - DO NOT MODIFY BY HAND

part of todo_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TodoItem> _$todoItemSerializer = new _$TodoItemSerializer();

class _$TodoItemSerializer implements StructuredSerializer<TodoItem> {
  @override
  final Iterable<Type> types = const [TodoItem, _$TodoItem];
  @override
  final String wireName = 'TodoItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, TodoItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'desc',
      serializers.serialize(object.desc, specifiedType: const FullType(String)),
      'begin',
      serializers.serialize(object.begin,
          specifiedType: const FullType(String)),
      'end',
      serializers.serialize(object.end, specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TodoItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodoItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'desc':
          result.desc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'begin':
          result.begin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'end':
          result.end = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TodoItem extends TodoItem {
  @override
  final int id;
  @override
  final String title;
  @override
  final String desc;
  @override
  final String begin;
  @override
  final String end;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$TodoItem([void Function(TodoItemBuilder)? updates]) =>
      (new TodoItemBuilder()..update(updates)).build();

  _$TodoItem._(
      {required this.id,
      required this.title,
      required this.desc,
      required this.begin,
      required this.end,
      required this.createdAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'TodoItem', 'id');
    BuiltValueNullFieldError.checkNotNull(title, 'TodoItem', 'title');
    BuiltValueNullFieldError.checkNotNull(desc, 'TodoItem', 'desc');
    BuiltValueNullFieldError.checkNotNull(begin, 'TodoItem', 'begin');
    BuiltValueNullFieldError.checkNotNull(end, 'TodoItem', 'end');
    BuiltValueNullFieldError.checkNotNull(createdAt, 'TodoItem', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(updatedAt, 'TodoItem', 'updatedAt');
  }

  @override
  TodoItem rebuild(void Function(TodoItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoItemBuilder toBuilder() => new TodoItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodoItem &&
        id == other.id &&
        title == other.title &&
        desc == other.desc &&
        begin == other.begin &&
        end == other.end &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), title.hashCode),
                        desc.hashCode),
                    begin.hashCode),
                end.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodoItem')
          ..add('id', id)
          ..add('title', title)
          ..add('desc', desc)
          ..add('begin', begin)
          ..add('end', end)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class TodoItemBuilder implements Builder<TodoItem, TodoItemBuilder> {
  _$TodoItem? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _desc;
  String? get desc => _$this._desc;
  set desc(String? desc) => _$this._desc = desc;

  String? _begin;
  String? get begin => _$this._begin;
  set begin(String? begin) => _$this._begin = begin;

  String? _end;
  String? get end => _$this._end;
  set end(String? end) => _$this._end = end;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  TodoItemBuilder();

  TodoItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _desc = $v.desc;
      _begin = $v.begin;
      _end = $v.end;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodoItem;
  }

  @override
  void update(void Function(TodoItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TodoItem build() {
    final _$result = _$v ??
        new _$TodoItem._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'TodoItem', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, 'TodoItem', 'title'),
            desc:
                BuiltValueNullFieldError.checkNotNull(desc, 'TodoItem', 'desc'),
            begin: BuiltValueNullFieldError.checkNotNull(
                begin, 'TodoItem', 'begin'),
            end: BuiltValueNullFieldError.checkNotNull(end, 'TodoItem', 'end'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, 'TodoItem', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, 'TodoItem', 'updatedAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
