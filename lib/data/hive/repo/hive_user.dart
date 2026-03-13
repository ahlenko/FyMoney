import 'package:fymoney/data/firebase/repo/user_repo.dart';
import 'package:fymoney/data/hive/hive_const.dart';
import 'package:fymoney/data/hive/model/user_data.dart';
import 'package:hive_ce/hive.dart';

abstract class HiveUser {
  static Future<void> setUserData({UserData? userData}) async {
    var userDataBox = await Hive.openBox<UserData>(HiveConst.userData);
    if (userData != null) {
      await userDataBox.clear();
      await userDataBox.put(HiveConst.userData, userData);
    } else {
      await userDataBox.clear();
    }
  }

  static Future<UserData?> getUserData({bool checkExistUser = false}) async {
    var userDataBox = await Hive.openBox<UserData>(HiveConst.userData);
    final userDocumentId = userDataBox.get(HiveConst.userData)?.documentId;

    if (checkExistUser && userDocumentId != null) {
      bool userAlreadyExist = await UserRepo.checkAlreadyExist(userDocumentId);

      if (userAlreadyExist) {
        return userDataBox.get(HiveConst.userData);
      } else {
        setUserData(userData: null);
        return null;
      }
    } else {
      return userDataBox.get(HiveConst.userData);
    }
  }
}
