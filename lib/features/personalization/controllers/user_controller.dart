import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_model.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user Record from any Registeration Provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert Name to First and Last Name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateuserName(userCredential.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '');

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      // Show Some Generic Error to the User
      AppLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }
  }
}
