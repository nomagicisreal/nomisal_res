library;

import 'package:damath/damath.dart';

part 'store/query.dart';
part 'store/sql.dart';
part 'store/storage.dart';
part 'store/transaction.dart';

///
///
/// [_RepositoryAuth]
/// [_RepositoryStore]
///
/// repositories create instance of the 3rd-party implementation for hub to use
///
///

// extension _RepositoryAuth on HubAuthOption {
//   A getAuth<A extends HubAuth>() {
//     switch (this) {
//       case HubAuthOption.fireauth:
//         return _RepoAuthFireauth() as A;
//       case HubAuthOption.simpleauth:
//         return _RepoAuthSimpleauth() as A;
//     }
//   }
// }

// extension _RepositoryStore on HubStoreOption {
//   S getStore<S extends HubStore>() {
//     switch (this) {
//       case HubStoreOption.firestore:
//         return _RepoStoreFirestore() as S;
//       case HubStoreOption.hive:
//         return _RepoStoreHive() as S;
//     }
//   }
// }

class StorePath {
  // user
  static const collectionUser = "users";
  static const userIdApp = "userId-app-";
  static const userIdOrg = "userId-org-";
  static const userIdEvent = "userId-event-";
  static const name = "name";
  static const createdAt = "createdAt: ";
  static const email = "email";
  static const phoneNumber = "phoneNumber";
  static const aboutMe = "aboutMe";
  static const photoUrl = "photoUrl";

  // messages
  static const collectionMessage = "messages";
  static const chattingWith = "chattingWith";
  static const idTo = "idTo";
  static const idFrom = "idFrom";
  static const timestamp = "timestamp";
  static const content = "content";
  static const type = "type";
}