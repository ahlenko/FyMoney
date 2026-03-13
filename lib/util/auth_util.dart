import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fymoney/data/firebase/model/user_creation_request.dart';
import 'package:fymoney/data/firebase/repo/user_repo.dart';
import 'package:fymoney/ui/dialogs/repeate_auth_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthUtil {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: hashPassword(password),
      );
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      log('FirebaseAuthUtil signUp error: $e');
      return e.toString();
    }

    return null;
  }

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: hashPassword(password),
      );
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      log('FirebaseAuthUtil login error: $e');
      return e.toString();
    }

    return null;
  }

  static Future<UserCreationRequest?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );

      final creds = await auth.signInWithCredential(cred);

      return UserCreationRequest(
        name: creds.user?.displayName,
        email: creds.user?.email?.toLowerCase(),
        uid: creds.user?.uid,
      );
    } catch (e) {
      log('FirebaseAuthUtil loginWithGoogle error: $e');
    }
    return null;
  }

  static Future<String?> deleteUser(BuildContext context) async {
    try {
      final user = auth.currentUser;

      if (user == null) {
        return 'user_not_logged_in';
      }

      final providerData = user.providerData.first;

      AuthCredential? credential;

      if (providerData.providerId == EmailAuthProvider.PROVIDER_ID) {
        final email = user.email;
        if (email == null) {
          return 'user_email_not_found';
        }

        final password = await UserRepo.getPasswordHash(
          auth.currentUser?.uid ?? '',
        );
        if (password == null) {
          return 'user_password_not_found';
        }

        credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );
        await user.reauthenticateWithCredential(credential);
      } else if (providerData.providerId == GoogleAuthProvider.PROVIDER_ID ||
          providerData.providerId == AppleAuthProvider.PROVIDER_ID) {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) {
            return RepeateAuthDialog(
              providerIsGoogle:
                  providerData.providerId == GoogleAuthProvider.PROVIDER_ID,
            );
          },
        );
        if (confirmed == true) {
          if (providerData.providerId == GoogleAuthProvider.PROVIDER_ID) {
            final googleUser = await GoogleSignIn().signIn();
            if (googleUser == null) {
              return 'google_sign_in_failed';
            }

            final googleAuth = await googleUser.authentication;
            credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );
            await user.reauthenticateWithCredential(credential);
          } else if (providerData.providerId == AppleAuthProvider.PROVIDER_ID) {
            final appleCredential = AppleAuthProvider();
            await user.reauthenticateWithProvider(appleCredential);
          }
        } else {
          return 'auth_cancelled';
        }
      } else {
        return 'unsupported_auth_provider';
      }

      await user.delete();
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      log('An unexpected error occurred: $e');
      return e.toString();
    }

    return null;
  }

  static Future<String?> changePassword({
    required String currentPassword,
    required String newPassword,
    bool useHash = true,
  }) async {
    try {
      final user = auth.currentUser;
      if (user == null) {
        return 'user_not_logged_in';
      }

      final email = user.email;
      if (email == null) {
        return 'user_email_not_found';
      }

      final credential = EmailAuthProvider.credential(
        email: email,
        password: useHash ? hashPassword(currentPassword) : currentPassword,
      );
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(hashPassword(newPassword));
      await UserRepo.savePasswordHash(newPassword);
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      log('FirebaseAuthUtil changePassword error: $e');
      return e.toString();
    }
    return null;
  }

  static List<String> getLinkedProviders() {
    final user = auth.currentUser;
    return user?.providerData.map((info) => info.providerId).toList() ?? [];
  }

  static Future<void> signout() async {
    await auth.signOut();
  }

  static String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
