import 'package:task_app/data/shared_preference/shared_preference_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core_needs/variables/global_variables.dart';
import 'models/user.dart';

class SharedPreferenceService {
  late SharedPreferences sharedPreferences;

  SharedPreferenceService._internal(this.sharedPreferences);

  static Future<SharedPreferenceService> create() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return SharedPreferenceService._internal(sharedPreferences);
  }

  void createUserData({required User user}) {
    bool? isUserDataPresent = sharedPreferences.getBool(PrefConstant.sIsUserDataPresent);
    if (isUserDataPresent == null || !isUserDataPresent) {
      sharedPreferences.setInt(PrefConstant.sContactNumber, user.contactNumber);
      sharedPreferences.setString(PrefConstant.sUserName, user.name);
      sharedPreferences.setBool(PrefConstant.sIsUserDataPresent, true);
      logger.i("Created User in SharedPreference successfully");
    } else {
      logger.w("User is already present in SharedPreference!");
    }
  }

  User? getUserDetails() {
    String? userName = sharedPreferences.getString(PrefConstant.sUserName);
    int? contactNumber = sharedPreferences.getInt(PrefConstant.sContactNumber);

    if (userName != null && contactNumber != null) {
      logger.i("User Successfully fetched in $runtimeType");
      return User(name: userName, contactNumber: contactNumber);
    }
    logger.w("User not fetched in $runtimeType [userName: $userName, contactNumber: $contactNumber]");
    return null;
  }
}
