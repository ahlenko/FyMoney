import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fymoney/data/firebase/model/user_creation_request.dart';
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

  static Future<void> signout() async {
    await auth.signOut();
  }

  static String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
