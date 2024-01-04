import 'package:basada_admin/app/modules/home/models/profile_model.dart';
import 'package:basada_admin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileProvider extends GetConnect {
  Future<ProfileModel> getProfile(String bearer) async {
    final header = {
      'token': bearer,
    };

    final request = await get(
      '${Routes.baseUrl}api/admin/profile',
      headers: header,
    );

    if (request.statusCode == 200) {
      return ProfileModel.fromJson(request.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
