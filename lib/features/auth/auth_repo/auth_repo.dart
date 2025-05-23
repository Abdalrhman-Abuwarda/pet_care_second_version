
import '../../../data/local_data/storage_service.dart';
import '../../../data/remote-data/base_client.dart';
import '../../../data/remote-data/end_point.dart';
import '../../../locator.dart';
import '../auth_model/user_model.dart';

class AuthRepo {
  AuthRepo({required this.client});

  final DioClient client;

  Future<UserModel> loginRepo(
      {required String email, required String password}) async {
    final response = await client
        .post(Endpoints.login, data: {"email": email, "password": password});
    sl<StorageService>().saveAccessToken(token: response.data["tokens"]["access_token"]);
    final user =UserModel.fromJson(response.data["user"]);
    return user;
  }

  Future<dynamic> signupRepo(
      {required String email,
      required String name,
      required String password,
      required String phoneNumber}) async {
    final response = await client.post(Endpoints.signIn, data:
    {
      "email": email,
      "name" : name,
      "password" : password,
      "phoneNumber" : phoneNumber
    });
  }

  Future<dynamic> sendEmailVerificationCodeRepo({required String email}) async {
    final response = client.get(Endpoints.sendEmailVerificationCode, );
  }


}
