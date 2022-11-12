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
  final firebaseMessagingToken = FirebaseMessaging.instance.getToken();
  String fcmToken = '';

  @override
  void onInit() async {
    super.onInit();
    FlutterNativeSplash.remove();
    change(null, status: RxStatus.empty());
    // final regId = await FirebaseMessaging.instance.getToken();
    await addDevice();
    getDataPenjemputan();
  }

  Future<void> addDevice() async {
    await firebaseMessagingToken.then((value) {
      fcmToken = value.toString();
    });
    await ListPenjemputanProvider()
        .addDevice(box.read('token'), fcmToken)
        .then((value) => print("Device added"));
  }

  void logout() {
    box.remove(Routes.USER_ID);
    box.remove(Routes.ROLE);
    box.remove(Routes.TOKEN);
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<void> getProfile() async {
    final bearer = box.read(Routes.TOKEN);
    change(null, status: RxStatus.loading());
    await ProfileProvider().getProfile(bearer).then((value) {
      profile.value = value;
      change(null, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
  }

  void navigateAndRefresh(dynamic arguments) async {
    final result = await Get.toNamed(Routes.DETAIL, arguments: arguments);
    if (result == null) {
      getDataPenjemputan(); // call your own function here to refresh screen
    }
  }

  void getDataPenjemputan() async {
    change(null, status: RxStatus.loading());
    await getProfile();
    await ListPenjemputanProvider()
        .getListPenjemputan(
      box.read(Routes.TOKEN),
    )
        .then(
      (value) => {
        change(null, status: RxStatus.success()),
        // value = value
        //     .where(
        //         (element) => element.keterangan == 'Sampah Belum Dikonfirmasi')
        //     .toList(),
        dataPenjemputan.assignAll(value),
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
