import 'package:apps/features/authentication/models/user_model.dart';
import 'package:apps/utils/local_storage/storage_utility.dart';
import '../repositories/authentication/authentication_repository.dart';

class AuthenticationService {
  final AuthenticationRepository _authRepository = AuthenticationRepository();
  final LocalStorage _localStorage = LocalStorage();

  // Register
  Future<void> register(Map<String, dynamic> data) async {
    final response = await _authRepository.register(data);

    if (response['status'] == 'success') {
      final token = response['data']['token'];
      final userJson = response['data']['user'];
      final user = UserModel.fromJson(userJson);

      await _localStorage.saveData('token', token);
      await _localStorage.saveData('user', user.toJson());
    } else {
      throw Exception(response['message']);
    }
  }

  // Login
  Future<void> login(Map<String, dynamic> data) async {
    final response = await _authRepository.login(data);

    if (response['status'] == 'success') {
      final token = response['data']['token'];
      final userJson = response['data']['user'];
      final user = UserModel.fromJson(userJson);

      await _localStorage.saveData('token', token);
      await _localStorage.saveData('user', user.toJson());
    } else {
      throw Exception(response['message']);
    }
  }

  // Logout
  Future<void> logout() async {
    await _localStorage.removeData('token');
    await _localStorage.removeData('user');
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = _localStorage.readData<String>('token');
    return token != null;
  }

  // Get current user
  Future<UserModel?> getCurrentUser() async {
    final userJson = _localStorage.readData<Map<String, dynamic>>('user');
    if (userJson != null) {
      return UserModel.fromJson(userJson);
    }
    return null;
  }
}
