part of '../repo.dart';

///
///
/// for all the transaction of an application, seamless between local storage and cloud storage
///
/// 1. (solo) the functionality of a single 'data', 'model', 'entity'
/// 2. (set) the functionality in a type of 'data', 'model', 'entity'
/// 2. (set) the functionality between the type of 'data', 'model', 'entity'.
///
/// data solo:
/// [FieldsSet]
///
/// data set:
/// [EqualOrNot]
/// [DataArgumentSet]
/// [DataExtension]
/// [StreamStructureExtension]
///
///
///

///
/// json_annotation: https://pub.dev/packages/json_annotation
///     dart pub add json_annotation
///     dart pub add --dev json_serializable
/// freezed: https://pub.dev/packages/freezed
///     dart pub add freezed_annotation
///     dart pub add --dev build_runner
///     dart pub add --dev freezed
/// dart run build_runner build --delete-conflicting-outputs
///
///

typedef Json = Map<String, dynamic>;
typedef FieldsSet = Map<String, EqualOrNot<dynamic>>;
typedef BaseTransaction = Future<void> Function();

///
///
///
/// [FieldsSet] example,
///
/// final p1 = Person(name: 'Abby', phone: '0000');
/// final p2 = Person(name: 'Abby', phone: '999');
/// final p3 = Person(name: 'Abby', phone: '0000');
/// final match1 = service.get(
///   query: QueryWhere( see []
///     fieldsMatch: {
///       'name': MapEntry('Abby', null),
///     }, // equal 'Abby'
///   ),
/// );
/// print(match1); // p1, p2, p3
///
/// final match2 = service.get(
///   query: QueryWhere( see [QueryWhere]
///     fieldsMatch: {
///       'name': MapEntry('Abby', null),
///       'phone': MapEntry(null, '999')
///     }, // equal 'Abby', but not equal '999'
///   ),
/// );
/// print(match2); // p1, p2
///
class EqualOrNot<A> {
  final A? equalValue;
  final A? notEqualValue;
  const EqualOrNot._(this.equalValue, this.notEqualValue);
  const factory EqualOrNot(A? equalValue, A? notEqualValue) = EqualOrNot<A>._;
}


// mixin MixData<D> on Data<D>
//     implements
//         MixDataInsert<D>,
//         MixDataGet<D>,
//         MixDataUpdate<D>,
//         MixDataDelete<D> {
//
//   /// queue
//   Future<void> queueTransaction({
//     required List<BaseTransaction> transactions,
//   }) async {
//     for (var t in transactions) {
//       await t();
//     }
//   }
//
//   /// schedule
//   Future<void> scheduleTransaction({
//     required Map<DateTime, BaseTransaction> transactions,
//   }) async {
//     throw UnimplementedError();
//   }
// }
//
// mixin MixDataInsert<D> on Data<D> implements MixDataGet<D> {
//   // Map<HubStore, String> get _storeId => storeId.map<HubStore, String>((key, value) => )
//   //
//   // Future<void> insert() {
//   //   final list = storeId.entries.map((e) => MapE)
//   //   for (Map<> element in storeId.entries) {
//   //     element.key
//   //   }_storeService.insert(_model);
//   // }
//
//   Future<void> insertBeforeCheck({
//     QueryWhere<D>? queryWhere,
//     required Future<bool> Function(Result<D> queriedModels) askIfInsert,
//   }) async {
//     assert(queryWhere != null);
//     if (await askIfInsert(await get(queryWhere: queryWhere))) {
//       insert();
//     }
//   }
// }
// mixin MixDataGet<D> on Data<D> {
//   Future<Result<D>> get({
//     QueryWhere<D>? queryWhere,
//   }) async {
//     assert(queryWhere != null);
//     return _storeService.get(where: queryWhere!);
//   }
// }
//
// mixin MixDataUpdate<D> on Data<D> implements
//     MixDataGet<D> {
//   Future<void> update() => _storeService.update(_model);
//
//   Future<void> updateBeforeACheck({
//     QueryWhere<D>? queryWhere,
//     required Future<bool> Function(Result<D> queriedModels) askIfUpdate,
//   }) async {
//     assert(queryWhere != null);
//     if (await askIfUpdate(await get(queryWhere: queryWhere))) {
//       update();
//     }
//   }
// }
//
// mixin MixDataDelete<D> on Data<D>
// implements MixDataGet<D> {
//   Future<void> delete() => _storeService.delete(_model);
//
//   Future<void> deleteBeforeCheck({
//     QueryWhere<D>? queryWhere,
//     required Future<bool> Function(Result<D> queriedModels) askIfDelete,
//   }) async {
//     assert(queryWhere != null);
//     if (await askIfDelete(await get(queryWhere: queryWhere))) {
//       delete();
//     }
//   }
// }
//
//
// class DataArgumentSet<D extends Data> {
//   final Json? fields;
//   final D? another;
//
//   const DataArgumentSet._({
//     this.fields,
//     this.another,
//   });
//
//   factory DataArgumentSet.forFields(Json fields) => DataArgumentSet._(fields: fields);
//   factory DataArgumentSet.forAnother(D another) => DataArgumentSet._(another: another);
// }
//
// extension DataExtension<D extends Data> on Data {
//   FieldsSet difference(DataArgumentSet<D> argument) {
//     final match = <String, EqualOrNot<dynamic>>{};
//
//     ///
//     if (argument.fields != null) {
//       for (var field in argument.fields!.entries) {
//         final name = field.key;
//         final value = field.value;
//         if (toJson[name] == value) {
//           match.putIfAbsent(name, () => EqualOrNot(value, null));
//         } else {
//           match.putIfAbsent(name, () => EqualOrNot(null, value));
//         }
//       }
//
//       ///
//     } else if (argument.another != null) {
//       _forEachPropsWith(
//         another: argument.another as D,
//         fun: (fieldName, v1, v2) {
//           late final EqualOrNot<dynamic> equalOrNot;
//           if (v1 == v2) {
//             equalOrNot = EqualOrNot(v2, null);
//           } else {
//             equalOrNot = EqualOrNot(null, v2);
//           }
//           match.putIfAbsent(fieldName, () => equalOrNot);
//         },
//       );
//
//       ///
//     } else {
//       throw UnimplementedError();
//     }
//     return match;
//   }
//
//   bool match<d extends Data>(FieldsSet fieldsMatch) {
//     if (D == d) {
//       for (var field in fieldsMatch.entries) {
//         final value = toJson[field.key];
//         final equalOrNot = field.value;
//
//         if (equalOrNot.equalValue != null) {
//           if (value != equalOrNot.equalValue) {
//             return false;
//           }
//         } else {
//           if (value == equalOrNot.notEqualValue) {
//             return false;
//           }
//         }
//       }
//       return true;
//     } else {
//       throw UnimplementedError();
//     }
//   }
//
//   void _forEachPropsWith({
//     /// v1 is value of current-instance,
//     /// v2 is value of argument-instance
//
//     required D another,
//     required void Function(String fieldName, dynamic v1, dynamic v2) fun,
//   }) =>
//       another.toJson.forEach((key, value) => fun(key, toJson[key], value));
//
//
//   // void retain(ArgumentSet<D> argument);
//   // void retainWhere(bool Function(ArgumentSet<D> argument) test);
//   // M intersection(ArgumentSet<D> query);
//   // M union(ArgumentSet<D> query);
// }



/// insert
// Future<bool> Function(M existModel)? replaceWhen,

/// get
// @immutable
// class _TransactionArgumentGet {
//   final _TransactionInputHowMuch howMuch;
//   final _TransactionInputWhen when;
//   final _TransactionInputWhere where;
//   final _TransactionInputWho who;
//   const _TransactionArgumentGet({
//     this.howMuch = const _TransactionInputHowMuch(),
//     this.when = const _TransactionInputWhen(),
//     this.where = const _TransactionInputWhere(),
//     this.who = const _TransactionInputWho(),
//   });
// }
//
// typedef EntryEntrySetStringAndBoolAndBool = MapEntry<MapEntry<Set<String>, bool>, bool>;

/// update
// @immutable
// class _TransactionArgumentUpdate {
//   final Object? updateModel;
//   final MapEntry<_TransactionArgumentGet, M Function<M>(M model)>? updateAfterGet;
//
//   const _TransactionArgumentUpdate({
//     this.updateModel,
//     this.updateAfterGet,
//   }) : assert(updateModel == null || updateAfterGet == null);
// }

/// delete
// @immutable
// class _TransactionArgumentDelete {
//   final Object? deleteModel;
//   final MapEntry<_TransactionArgumentGet, M Function<M>(M model)>? deleteAfterGet;
//
//   const _TransactionArgumentDelete({
//     this.deleteModel,
//     this.deleteAfterGet,
//   }) : assert(deleteModel == null || deleteAfterGet == null);
// }
//

