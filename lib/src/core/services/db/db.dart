import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages, deprecated_member_use
import 'package:drift_dev/api/migrations.dart';

import '../../../core/error/error.dart';
part 'db.g.dart';

@DriftDatabase(
  tables: [],
)
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase();

  static AppDatabase instance() => _instance;

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  Future<D?> getSingle<T extends Table, D>(TableInfo<T, D> table,
      Expression<int> Function(T) idSelector, int id) async {
    try {
      D? model = await (select(table)
            ..where((tbl) => idSelector(tbl).equals(id)))
          .getSingleOrNull();

      return model;
    } catch (e) {
      throw LocalStorageException();
    }
  }

  Future<int> saveSingle<T extends Table, D>(
      TableInfo<T, D> table, Insertable<D> model) async {
    try {
      AppDatabase db = AppDatabase.instance();
      var id = await db.into(table).insertOnConflictUpdate(model);
      return id;
    } catch (e) {
      throw LocalStorageException();
    }
  }

  Future<void> saveAll<T extends Table, D>(
    TableInfo<T, D> table,
    List<Insertable<D>> models,
  ) async {
    try {
      final db = AppDatabase.instance();
      await db.batch((batch) {
        batch.insertAllOnConflictUpdate(table, models);
      });
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  Future<void> saveAllWithNoConflict<T extends Table, D>(
    TableInfo<T, D> table,
    List<Insertable<D>> models,
  ) async {
    try {
      final db = AppDatabase.instance();
      await db.batch((batch) {
        // Use `insertAll` to strictly insert new rows without updates
        batch.insertAll(table, models, mode: InsertMode.insert);
      });
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  Future<List<D>> getAll<T extends Table, D>(TableInfo<T, D> table) async {
    try {
      final db = AppDatabase.instance();
      return await db.select(table).get();
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  //item

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      ///This method is executed only the first time when database is created
      onCreate: (Migrator m) async {
        await m.createAll();
      },

      ///This method is executed every time we increase the schemaVersion number
      ///In this method is where we are handling our migration
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          //await m.addColumn(artist, artist.isActive);
          ///The code line below is when you need to migrate newly added table
          //await m.create(newTable);
        }
      },

      ///This method is helpful as it help us during development phase to check if we did migration correctly
      beforeOpen: (details) async {
        if (kDebugMode) {
          await validateDatabaseSchema();
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
