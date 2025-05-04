part of '../hub.dart';

///
/// [AuthUser]
/// [AuthEvent]
/// [AuthOrg]
///
///
class AuthUser {
  final String id;

  // final String email;

  const AuthUser({required this.id});
}

class AuthEvent {
  final String eventName;
  // final String email;
  final bool eventUiHasA = true;//attendance
  final bool eventUiHasB = true;//bringUp
  final bool eventUiHasC = true;//conduct

  const AuthEvent({required this.eventName});

}

class AuthOrg {
  final String orgName;
  // final String email;

  const AuthOrg({required this.orgName});

}