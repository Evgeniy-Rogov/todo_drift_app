// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CasesTable extends Cases with TableInfo<$CasesTable, Case> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cases';
  @override
  VerificationContext validateIntegrity(Insertable<Case> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Case map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Case(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $CasesTable createAlias(String alias) {
    return $CasesTable(attachedDatabase, alias);
  }
}

class Case extends DataClass implements Insertable<Case> {
  final int id;
  final String title;
  const Case({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  CasesCompanion toCompanion(bool nullToAbsent) {
    return CasesCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory Case.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Case(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  Case copyWith({int? id, String? title}) => Case(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  Case copyWithCompanion(CasesCompanion data) {
    return Case(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Case(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Case && other.id == this.id && other.title == this.title);
}

class CasesCompanion extends UpdateCompanion<Case> {
  final Value<int> id;
  final Value<String> title;
  const CasesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  CasesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<Case> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  CasesCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return CasesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CasesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<int> caseId = GeneratedColumn<int>(
      'case_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES cases (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [id, body, caseId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(_caseIdMeta,
          caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta));
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      caseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}case_id'])!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String body;
  final int caseId;
  const Task({required this.id, required this.body, required this.caseId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['body'] = Variable<String>(body);
    map['case_id'] = Variable<int>(caseId);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      body: Value(body),
      caseId: Value(caseId),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      body: serializer.fromJson<String>(json['body']),
      caseId: serializer.fromJson<int>(json['caseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'body': serializer.toJson<String>(body),
      'caseId': serializer.toJson<int>(caseId),
    };
  }

  Task copyWith({int? id, String? body, int? caseId}) => Task(
        id: id ?? this.id,
        body: body ?? this.body,
        caseId: caseId ?? this.caseId,
      );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      body: data.body.present ? data.body.value : this.body,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('caseId: $caseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, body, caseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.body == this.body &&
          other.caseId == this.caseId);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> body;
  final Value<int> caseId;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.caseId = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String body,
    required int caseId,
  })  : body = Value(body),
        caseId = Value(caseId);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? body,
    Expression<int>? caseId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'body': body,
      if (caseId != null) 'case_id': caseId,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id, Value<String>? body, Value<int>? caseId}) {
    return TasksCompanion(
      id: id ?? this.id,
      body: body ?? this.body,
      caseId: caseId ?? this.caseId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<int>(caseId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('caseId: $caseId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $CasesTable cases = $CasesTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final Index taskCaseId =
      Index('task_case_id', 'CREATE INDEX task_case_id ON tasks (case_id)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cases, tasks, taskCaseId];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('cases',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('tasks', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$CasesTableCreateCompanionBuilder = CasesCompanion Function({
  Value<int> id,
  required String title,
});
typedef $$CasesTableUpdateCompanionBuilder = CasesCompanion Function({
  Value<int> id,
  Value<String> title,
});

final class $$CasesTableReferences
    extends BaseReferences<_$Database, $CasesTable, Case> {
  $$CasesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TasksTable, List<Task>> _tasksRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.tasks,
          aliasName: $_aliasNameGenerator(db.cases.id, db.tasks.caseId));

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager($_db, $_db.tasks)
        .filter((f) => f.caseId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CasesTableFilterComposer extends Composer<_$Database, $CasesTable> {
  $$CasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  Expression<bool> tasksRefs(
      Expression<bool> Function($$TasksTableFilterComposer f) f) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tasks,
        getReferencedColumn: (t) => t.caseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TasksTableFilterComposer(
              $db: $db,
              $table: $db.tasks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CasesTableOrderingComposer extends Composer<_$Database, $CasesTable> {
  $$CasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));
}

class $$CasesTableAnnotationComposer extends Composer<_$Database, $CasesTable> {
  $$CasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  Expression<T> tasksRefs<T extends Object>(
      Expression<T> Function($$TasksTableAnnotationComposer a) f) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tasks,
        getReferencedColumn: (t) => t.caseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TasksTableAnnotationComposer(
              $db: $db,
              $table: $db.tasks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CasesTableTableManager extends RootTableManager<
    _$Database,
    $CasesTable,
    Case,
    $$CasesTableFilterComposer,
    $$CasesTableOrderingComposer,
    $$CasesTableAnnotationComposer,
    $$CasesTableCreateCompanionBuilder,
    $$CasesTableUpdateCompanionBuilder,
    (Case, $$CasesTableReferences),
    Case,
    PrefetchHooks Function({bool tasksRefs})> {
  $$CasesTableTableManager(_$Database db, $CasesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
          }) =>
              CasesCompanion(
            id: id,
            title: title,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
          }) =>
              CasesCompanion.insert(
            id: id,
            title: title,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$CasesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({tasksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tasksRefs) db.tasks],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CasesTableReferences._tasksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CasesTableReferences(db, table, p0).tasksRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.caseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CasesTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $CasesTable,
    Case,
    $$CasesTableFilterComposer,
    $$CasesTableOrderingComposer,
    $$CasesTableAnnotationComposer,
    $$CasesTableCreateCompanionBuilder,
    $$CasesTableUpdateCompanionBuilder,
    (Case, $$CasesTableReferences),
    Case,
    PrefetchHooks Function({bool tasksRefs})>;
typedef $$TasksTableCreateCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  required String body,
  required int caseId,
});
typedef $$TasksTableUpdateCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  Value<String> body,
  Value<int> caseId,
});

final class $$TasksTableReferences
    extends BaseReferences<_$Database, $TasksTable, Task> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CasesTable _caseIdTable(_$Database db) =>
      db.cases.createAlias($_aliasNameGenerator(db.tasks.caseId, db.cases.id));

  $$CasesTableProcessedTableManager? get caseId {
    if ($_item.caseId == null) return null;
    final manager = $$CasesTableTableManager($_db, $_db.cases)
        .filter((f) => f.id($_item.caseId!));
    final item = $_typedResult.readTableOrNull(_caseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TasksTableFilterComposer extends Composer<_$Database, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  $$CasesTableFilterComposer get caseId {
    final $$CasesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.caseId,
        referencedTable: $db.cases,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CasesTableFilterComposer(
              $db: $db,
              $table: $db.cases,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TasksTableOrderingComposer extends Composer<_$Database, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  $$CasesTableOrderingComposer get caseId {
    final $$CasesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.caseId,
        referencedTable: $db.cases,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CasesTableOrderingComposer(
              $db: $db,
              $table: $db.cases,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TasksTableAnnotationComposer extends Composer<_$Database, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  $$CasesTableAnnotationComposer get caseId {
    final $$CasesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.caseId,
        referencedTable: $db.cases,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CasesTableAnnotationComposer(
              $db: $db,
              $table: $db.cases,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TasksTableTableManager extends RootTableManager<
    _$Database,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, $$TasksTableReferences),
    Task,
    PrefetchHooks Function({bool caseId})> {
  $$TasksTableTableManager(_$Database db, $TasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<int> caseId = const Value.absent(),
          }) =>
              TasksCompanion(
            id: id,
            body: body,
            caseId: caseId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String body,
            required int caseId,
          }) =>
              TasksCompanion.insert(
            id: id,
            body: body,
            caseId: caseId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TasksTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({caseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (caseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.caseId,
                    referencedTable: $$TasksTableReferences._caseIdTable(db),
                    referencedColumn:
                        $$TasksTableReferences._caseIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TasksTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, $$TasksTableReferences),
    Task,
    PrefetchHooks Function({bool caseId})>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$CasesTableTableManager get cases =>
      $$CasesTableTableManager(_db, _db.cases);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
}
