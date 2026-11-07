import '../../../core/api/api_client.dart';
import '../../../core/constants/api_constants.dart';

class AuthRepository {
  final ApiClient apiClient = ApiClient();

  Future<void> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    await apiClient.dio.post(
      ApiConstants.signUp,
      data: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      },
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    await apiClient.dio.post(
      ApiConstants.signIn,
      data: {"email": email, "password": password},
    );
  }

  Future<void> sendResetCode({required String email}) async {
    await apiClient.dio.post(
      ApiConstants.resetPassCode,
      data: {"email": email},
    );
  }

  Future<void> verifyOtp({required String email, required String code}) async {
    await apiClient.dio.post(
      ApiConstants.activeResetPass,
      data: {"email": email, "code": code},
    );
  }

  Future<void> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    await apiClient.dio.post(
      ApiConstants.resetPassword,
      data: {
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      },
    );
  }
}
