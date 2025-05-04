// ignore_for_file: unused_element
part of '../repo.dart';

///
/// [_FStringSQL]
///


extension _FStringSQL on String {
  static String createTable(
      String name,
      String primaryKeyName,
      String primaryKeyType,
      Map<String, String> attributes,
      ) =>
      "CREATE TABLE $name (${attributes.fold(
        StringBuffer('$primaryKeyName $primaryKeyType PRIMARY KEY'),
            (buffer, entry) => buffer..write(', ${entry.key} ${entry.value}'),
      )})";

  static String selectFromTable(
      String tableName, {
        String selection = '*', // select all
      }) =>
      'SELECT $selection FROM $tableName';

  static String selectFromTableCount(
      String tableName, {
        int? count,
      }) =>
      selectFromTable(tableName, selection: 'COUNT(${count ?? '*'})');

  static String insertTable(String tableName, Map<String, String> entity) =>
      "INSERT INTO $tableName(${entity.keys.join(
        ', ',
      )}) VALUES(${entity.values.join(
        ', ',
      )})";

  static Iterable<String> insertTableAll(
      String tableName,
      Iterable<Map<String, String>> entities,
      ) =>
      entities.fold<List<String>>(
        [],
            (list, entity) => list..add(insertTable(tableName, entity)),
      );

  static String updateTable(
      String tableName,
      Map<String, String> update, {
        required Map<String, String> where,
      }) =>
      'UPDATE $tableName SET ${update.join(' = ', ', ')} WHERE ${where.join(' = ', ', ')}';

  static Iterable<String> updateTableAll(
      String tableName,
      Map<Map<String, String>, Map<String, String>> updateWhere,
      ) =>
      updateWhere.fold<List<String>>(
        [],
            (list, entity) => list
          ..add(updateTable(
            tableName,
            entity.key,
            where: entity.value,
          )),
      );

  static String deleteFromTable(
      String tableName,
      Map<String, String> where,
      ) =>
      'DELETE FROM $tableName WHERE ${where.join(' = ', ', ')}';
}