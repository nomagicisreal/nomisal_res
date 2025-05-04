part of 'source.dart';

///
/// this file contains all the custom errors and exceptions:
/// ------------------------------------------------------------error:
/// [ParseEnumError]
/// [ParseStringError]
/// [StreamError]
///
///
/// ------------------------------------------------------------exception:
/// [CustomException]
///
/// [AuthException]
///
/// [AuthRegisterException]
/// [AuthLoginException]
/// [AuthLogoutException]
/// [AuthNoImplementationException]
///
/// [RegisterWeakPasswordException]
/// [RegisterEmailAlreadyInUseException]
/// [RegisterInvalidEmailException]
/// [LoginFailException]
/// [LoginIdpNotSignedException]
/// [LoginUserNotFoundException]
/// [LoginWrongPasswordException]
/// [LoginUserNotLoggedInException]
///
/// [StoreException]
///
/// [StoreModelNoIdException]
/// [StoreDataNotFoundException]
///
///
///
///
///
///
///

class ParseEnumError extends Error {
  final Type type;

  ParseEnumError(this.type);

  @override
  String toString() => '$type not enum';
}

class ParseStringError extends Error {
  final String s;

  ParseStringError(this.s);

  @override
  String toString() => '$s not valid string';
}

class StreamError extends UnimplementedError {
  StreamError(super.message);
}


///
///
/// -----
///
///

sealed class CustomException implements Exception {
  // String messageOf(BuildContext context);
}

///
/// auth exception
///

sealed class AuthException implements CustomException {}

abstract class AuthRegisterException extends AuthException {}

abstract class AuthLoginException extends AuthException {}

abstract class AuthLogoutException extends AuthException {}

class AuthNoImplementationException extends AuthException {}

/// register
class RegisterWeakPasswordException extends AuthRegisterException {}

class RegisterEmailAlreadyInUseException extends AuthRegisterException {}

class RegisterInvalidEmailException extends AuthRegisterException {}

/// login
class LoginFailException extends AuthLoginException {}

class LoginIdpNotSignedException extends AuthLoginException {}

class LoginUserNotFoundException extends AuthLoginException {}

class LoginWrongPasswordException extends AuthLoginException {}

class LoginUserNotLoggedInException extends AuthLoginException {}

///
/// store exception
///

abstract class StoreException implements CustomException {}

class StoreModelNoIdException extends StoreException {}

class StoreDataNotFoundException extends StoreException {}

///
/// other
///

class ScreenNotInGraphException implements CustomException {}
