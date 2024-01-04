import 'package:basada_admin/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../models/login_model.dart';

class LoginProvider extends GetConnect {
  Future<LoginModel> login(String email, String password) async {
    final response = await post(
      "${Routes.baseUrl}api/login",
      {
        "email": email,
        "password": password,
      },
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(response.body);
      return LoginModel.fromJson(response.body);
    }
  }
}
