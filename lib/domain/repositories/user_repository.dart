import '../../data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUserProfile(String userId);

  Future<UserModel> updateUserProfile({
    required String userId,
    String? name,
    String? phone,
    String? profileImageUrl,
  });
}
