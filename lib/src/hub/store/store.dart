part of '../hub.dart';

///
/// [HubStoreOption]
/// [HubStore]
///
///

enum HubStoreOption {
  firestore,
  hive,
}

typedef HubStoreId = Map<HubStoreOption, String>;

///
/// define general store methods for anonymous user
///
abstract class HubStore extends Hub<HubStoreOption> {
  const HubStore();

  // Future<void> insert<D extends Data>(D data);
  // Future<void> update<D extends Data>(D data);
  // Future<void> delete<D extends Data>(D data);
  //
  // Future<Result<D>> get<D extends Data>({required QueryWhere<D> where});
  // Stream<Result<D>> watch<D extends Data>({required QueryWhere<D> where});
}