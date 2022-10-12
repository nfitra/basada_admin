import 'package:basada_admin/app/modules/detail/models/jenis_sampah_model.dart';
import 'package:basada_admin/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../models/detail_penjemputan_model.dart';

class DetailPenjemputanProviders extends GetConnect {
  Future<DetailPenjemputan> getDetailPenjemputan(
      String token, String id) async {
    final response = await get(
      '${Routes.BASE_URL}api/request/$id',
      headers: {
        'token': token,
      },
    );
    if (response.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return DetailPenjemputan.fromJson(response.body as Map<String, dynamic>);
    }
  }

  Future<String> editBeratSampah(
      String id, String berat, String status, String bearer) async {
    final form = FormData({
      'status': status,
      'berat': berat,
      'id_sampah': id,
    });

    final response = await put(
      '${Routes.BASE_URL}api/request/$id',
      form,
      headers: {
        'token': bearer,
      },
    );

    if (response.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body['message'];
    }
  }

  Future<List<JenisSampahModel>> getJenisSampah(String bearer) async {
    final token = {
      'token': bearer,
    };
    final response = await get('${Routes.BASE_URL}api/sampah', headers: token);
    if (response.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return (response.body as List)
          .map((e) => JenisSampahModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  Future<String> updateJenisSampah(
      String id, String jenisSampah, String bearer) async {
    final form = FormData({
      'id_sampah': id,
      'jenis_sampah': jenisSampah,
    });

    final response = await put(
      '${Routes.BASE_URL}api/request/$id',
      form,
      headers: {
        'token': bearer,
      },
    );

    if (response.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body['message'];
    }
  }

  Future<String> updateBeratSampah(
      String id, String id_sampah, String berat, String bearer) async {
    final form = FormData({
      'id_sampah': id_sampah,
      'berat': int.parse(berat),
    });
    print(id_sampah);
    print(berat);
    print(id);

    final response = await put(
      '${Routes.BASE_URL}api/request/$id',
      form,
      headers: {
        'token': bearer,
      },
    );

    if (response.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print("Berhasil");
      return response.body;
    }
  }
}
