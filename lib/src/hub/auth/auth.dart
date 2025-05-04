part of '../hub.dart';

///
/// [HubAuthOption]
/// [HubAuth]
///
///

enum HubAuthOption {
  fireauth,
  simpleauth;
}

///
/// define general authentication methods for anonymous user
///
abstract class HubAuth extends Hub<HubAuthOption> {
  const HubAuth();

  // Future<AuthUser> register({required AuthRegisterCredential credential});
  //
  // Future<AuthUser> login({required AuthLoginCredential credential});
  //
  // Future<void> logout();
  //
  // Future<void> sendEmailVerification();
  //
  // Future<void> resetPassword(String email);
  //
  // Stream<AuthUserState> get authUserState;
  //
  // Future<void> updateAuthUser({
  //   required Future<AuthLoginCredential> Function(AuthLoginCredentialSetup credentialSetup)
  //       getReAuthCredential,
  //   required String? email,
  //   required String? password,
  //   required String? photoURL,
  //   required String? displayName,
  //   required String? phoneNumber,
  //   required PhoneVerification? phoneVerification,
  // });

}

