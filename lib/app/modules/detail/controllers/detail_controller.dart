import 'package:basada_admin/app/modules/detail/models/detail_penjemputan_model.dart';
import 'package:basada_admin/app/modules/detail/models/jenis_sampah_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../providers/detail_penjemputan_providers.dart';

class DetailController extends GetxController with StateMixin {
  final detail = DetailPenjemputan().obs;
  final alamat = 'Belum ada alamat'.obs;
  final latLng = const LatLng(0, 0).obs;
  final jenisSampah = <JenisSampahModel>[].obs;
  final selectedJenisSampah = ''.obs;
  final beratSampahController = TextEditingController();
  final idSampah = ''.obs;
  final idPenjualan = Get.arguments.toString();
  final idSampahTemp = ''.obs;
  final NumberFormat usCurrency = NumberFormat('#,##0', 'en_US');

  GetStorage box = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    await getDetail(Get.arguments.toString());

    await getJenisSampah();

    idSampahTemp.value = detail.value.fkGarbage!;
    beratSampahController.text = detail.value.rWeight.toString();
    await getAddress(geoToLatlong(detail.value.location ?? '')).then(
      (value) => alamat.value = value,
      onError: (error) => alamat.value = 'Belum ada alamat',
    );
    //  alamat.value = data;
    latLng.value = geoToLatlong(detail.value.location ?? '');
  }

  Future<void> getDetail(String id) async {
    change(null, status: RxStatus.loading());
    await DetailPenjemputanProviders()
        .getDetailPenjemputan(box.read(Routes.TOKEN), id)
        .then((value) => {
              detail.value = value,
              selectedJenisSampah.value = value.jenisSampah!,
              change(
                null,
                status: RxStatus.success(),
              ),
            })
        .onError(
      (error, stackTrace) {
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
        return Future.error("Terjadi kesalahan, silahkan coba lagi");
      },
    );
  }

  Future<void> getJenisSampah() async {
    change(null, status: RxStatus.loading());
    await DetailPenjemputanProviders()
        .getJenisSampah(box.read(Routes.TOKEN))
        .then((value) => {
              jenisSampah.assignAll(value),
              change(
                null,
                status: RxStatus.success(),
              ),
            })
        .onError(
      (error, stackTrace) {
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
        return Future.error("Terjadi kesalahan, silahkan coba lagi");
      },
    );
  }

  LatLng geoToLatlong(String string) {
    if (string == '') {
      return const LatLng(0, 0);
    }
    final String substring = string.substring(34, string.length - 2);
    final List<String> latlong = substring.split(',');
    final LatLng latLng = LatLng(
      double.parse(latlong[0]),
      double.parse(
        latlong[1],
      ),
    );
    return latLng;
  }

  Future<void> rejectRequest(String id, String idJenis, String berat) async {
    change(null, status: RxStatus.loading());
    await DetailPenjemputanProviders()
        .rejectRequest(id, idJenis, box.read(Routes.TOKEN), berat)
        .then((value) => {
              change(
                null,
                status: RxStatus.success(),
              ),
              getDetail(idPenjualan),
              Get.snackbar(
                'Berhasil',
                'Berhasil menolak permintaan',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              ),
            })
        .onError(
      (error, stackTrace) {
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
        return Future.error("Terjadi kesalahan, silahkan coba lagi");
      },
    );
  }

  Future<void> doneRequest(String id, String idJenis, String berat) async {
    change(null, status: RxStatus.loading());
    await DetailPenjemputanProviders()
        .doneRequest(id, idJenis, box.read(Routes.TOKEN), berat)
        .then((value) => {
              change(
                null,
                status: RxStatus.success(),
              ),
              getDetail(idPenjualan),
              Get.snackbar(
                'Berhasil',
                'Berhasil menerima permintaan',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              ),
            })
        .onError(
      (error, stackTrace) {
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
        return Future.error("Terjadi kesalahan, silahkan coba lagi");
      },
    );
  }

  Future<void> confirmRequest(String id, String idJenis, String berat) async {
    change(null, status: RxStatus.loading());
    await DetailPenjemputanProviders()
        .confirmRequest(id, idJenis, box.read(Routes.TOKEN), berat)
        .then((value) => {
              change(
                null,
                status: RxStatus.success(),
              ),
              getDetail(idPenjualan),
              Get.snackbar(
                'Berhasil',
                'Berhasil mengkonfirmasi permintaan',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              ),
            })
        .onError(
      (error, stackTrace) {
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
        return Future.error("Terjadi kesalahan, silahkan coba lagi");
      },
    );
  }

  Future<String> getAddress(LatLng coordinate) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      coordinate.latitude,
      coordinate.longitude,
    );
    final first = placemarks.first;
    final locality = first.locality ?? '';
    final administrativeArea = first.administrativeArea ?? '';
    final subLocality = first.subLocality ?? '';
    final subAdministrativeArea = first.subAdministrativeArea ?? '';
    final street = first.street ?? '';
    final addressLine =
        '$street, $locality, $subLocality, $subAdministrativeArea, $administrativeArea';
    return addressLine;
  }

  Future<void> updateBeratSampah(String idSampah) async {
    change(null, status: RxStatus.loading());
    await DetailPenjemputanProviders()
        .updateBeratSampah(idPenjualan, idSampah, beratSampahController.text,
            box.read(Routes.TOKEN))
        .then((value) => {
              change(
                null,
                status: RxStatus.success(),
              ),
              getDetail(idPenjualan),
            })
        .onError(
      (error, stackTrace) {
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
        return Future.error(error.toString());
      },
    );
  }

  Future<void> updateJenisSampah(String idSampah) async {
    change(null, status: RxStatus.loading());
    await DetailPenjemputanProviders()
        .updateBeratSampah(idPenjualan, idSampah, beratSampahController.text,
            box.read(Routes.TOKEN))
        .then((value) => {
              change(
                null,
                status: RxStatus.success(),
              ),
              getDetail(idPenjualan),
            })
        .onError(
      (error, stackTrace) {
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
        return Future.error(error.toString());
      },
    );
  }
}
