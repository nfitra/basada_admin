import 'package:basada_admin/app/modules/home/models/list_penjemputan.dart';
import 'package:basada_admin/app/modules/home/models/profile_model.dart';
import 'package:basada_admin/app/modules/home/providers/profile_profider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../providers/list_penjemputan_providers.dart';

class HomeController extends GetxController with StateMixin {
  GetStorage box = GetStorage();
  final dataPenjemputan = <ListPenjemputan>[].obs;
  final profile = ProfileModel().obs;

  @override
  void onInit() async {
    super.onInit();
    FlutterNativeSplash.remove();
    change(null, status: RxStatus.empty());
    // final regId = await FirebaseMessaging.instance.getToken();
    print(box.read('id_device'));
    getDataPenjemputan();
  }

  void logout() {
    ListPenjemputanProvider()
        .deleteDevice(box.read(Routes.token), box.read('id_device').toString())
        .then((value) {
      box.remove(Routes.userId);
      box.remove(Routes.role);
      box.remove(Routes.token);
      Get.offAllNamed(Routes.login);
    });
  }

  Future<void> getProfile() async {
    final bearer = box.read(Routes.token);
    change(null, status: RxStatus.loading());
    await ProfileProvider().getProfile(bearer).then((value) {
      profile.value = value;
      change(null, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
  }

  void navigateAndRefresh(dynamic arguments) async {
    final result = await Get.toNamed(Routes.detail, arguments: arguments);
    if (result == null) {
      getDataPenjemputan(); // call your own function here to refresh screen
    }
  }

  void getDataPenjemputan() async {
    change(null, status: RxStatus.loading());
    await getProfile();
    await ListPenjemputanProvider()
        .getListPenjemputan(
      box.read(Routes.token),
    )
        .then(
      (value) => {
        change(null, status: RxStatus.success()),
        dataPenjemputan.assignAll(value),
        dataPenjemputan.sort((a, b) => a.keterangan!.compareTo(b.keterangan!)),
      },
      onError: (err) {
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
      },
    );
  }
}
