import 'package:apps/utils/http/http_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  // Register
  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    return await HttpHelper.post('auth/register', data);
  }

  // Login
  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    return await HttpHelper.post('auth/login', data);
  }
}
