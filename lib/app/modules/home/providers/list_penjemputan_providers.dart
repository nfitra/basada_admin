import 'package:basada_admin/app/modules/home/models/list_penjemputan.dart';
import 'package:basada_admin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ListPenjemputanProvider extends GetConnect {
  Future<List<ListPenjemputan>> getListPenjemputan(String bearer) async {
    final headers = {
      'token': bearer,
    };
    final response = await get(
      "${Routes.BASE_URL}api/request/admin",
      headers: headers,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      final list = response.body as List;
      return list.map((e) => ListPenjemputan.fromJson(e)).toList();
    }
  }
}
