library;

part 'auth/auth.dart';
part 'auth/auth_user.dart';
part 'store/store.dart';

///
/// [Hub] is an delegate for anonymous user to have the basic application functions.
///

abstract class Hub<E extends Enum> {
  const Hub();

  E get hubOption;

}
