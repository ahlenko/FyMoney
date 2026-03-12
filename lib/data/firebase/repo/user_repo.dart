import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fymoney/data/firebase/model/user_creation_request.dart';
import 'package:fymoney/data/firebase/model/user_data.dart';
import 'package:fymoney/data/hive/repo/hive_user.dart';
import 'package:fymoney/util/auth_util.dart';

abstract class UserRepo {
  static final _firestore = FirebaseFirestore.instance;
  static const collection = 'users';

  static Future<UserData?> authUser(UserCreationRequest request) async {
    try {
      final existingUserQuery = await _firestore
          .collection(collection)
          .where('uid', isEqualTo: request.uid)
          .get();

      if (existingUserQuery.docs.isNotEmpty) {
        final existingUserData = existingUserQuery.docs.first.data();
        final userData = UserData.fromJson({
          ...existingUserData,
          'documentId': existingUserQuery.docs.first.id,
          'isNewUser': false,
        });

        return userData;
      }

      final docRef = _firestore.collection(collection).doc(request.uid);
      await docRef.set({
        ...request.toJson(),
        "createdAt": DateTime.now().toIso8601String(),
        "nameLower": request.name?.toLowerCase(),
      });
      final createdUserData = (await docRef.get()).data()!;
      final userData = UserData.fromJson({
        ...createdUserData,
        'documentId': docRef.id,
        'isNewUser': true,
      });

      return userData;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> checkAlreadyExist(String documentId) async {
    final docRef = _firestore.collection(collection).doc(documentId);
    final docSnapshot = await docRef.get();

    return docSnapshot.exists;
  }

  static Future<void> clipNewDeviceId(String? deviceId) async {
    if (deviceId == null) return;
    final userData = await HiveUser.getUserData();
    if (userData?.documentId == null) return;

    final docRef = _firestore.collection(collection).doc(userData!.documentId);

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(docRef);
      final List<dynamic> devices = snapshot.data()?['devices'] ?? [];

      if (!devices.contains(deviceId)) {
        final updatedDevices = [...devices, deviceId];
        transaction.update(docRef, {'devices': updatedDevices});
      }
    });
  }

  static Future savePasswordHash(String password) async {
    try {
      final userData = await HiveUser.getUserData();
      if (userData != null) {
        await _firestore.collection(collection).doc(userData.documentId).update(
          {'password': AuthUtil.hashPassword(password)},
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<String?> getPasswordHash(String? documentId) async {
    try {
      if (documentId != null) {
        final docSnapshot = await _firestore
            .collection(collection)
            .doc(documentId)
            .get();
        final data = docSnapshot.data();
        if (data != null && data.containsKey('password')) {
          return data['password'];
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
