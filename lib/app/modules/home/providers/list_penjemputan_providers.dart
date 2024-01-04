import 'package:basada_admin/app/modules/home/models/list_penjemputan.dart';
import 'package:basada_admin/app/modules/login/models/add_device_model.dart';
import 'package:basada_admin/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ListPenjemputanProvider extends GetConnect {
  final dio.Dio _dio = dio.Dio();

  Future<List<ListPenjemputan>> getListPenjemputan(String bearer) async {
    final headers = {
      'token': bearer,
    };
    final response = await get(
      "${Routes.baseUrl}api/request/admin",
      headers: headers,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      final list = response.body as List;
      return list.map((e) => ListPenjemputan.fromJson(e)).toList();
    }
  }

  Future<AddDeviceModel> addDevice(String token, String registrationId) async {
    final formData = dio.FormData.fromMap({
      'registration_id': registrationId,
    });
    final response = await _dio.post(
      '${Routes.baseUrl}/api/device',
      data: formData,
      options: dio.Options(
        headers: {
          'token': token,
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.data);
      return AddDeviceModel.fromJson(response.data);
    } else {
      return Future.error("Gagal menambahkan device");
    }
  }

  Future<String> deleteDevice(String token, String idDevice) async {
    final response = await _dio.delete(
      '${Routes.baseUrl}/api/device/$idDevice',
      options: dio.Options(
        headers: {
          'token': token,
        },
      ),
    );
    if (response.statusCode == 200) {
      return "delete device success";
    } else {
      return Future.error("Gagal menghapus device");
    }
  }
}
