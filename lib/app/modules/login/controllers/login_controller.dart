import 'package:basada_admin/app/modules/home/providers/list_penjemputan_providers.dart';
import 'package:basada_admin/app/modules/login/providers/login_provider.dart';
import 'package:basada_admin/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with StateMixin {
  late GetStorage box;
  late TextEditingController myControllerEmail;
  late TextEditingController myControllerPassword;
  final isPasswordHidden = true.obs;
  final firebaseMessagingToken = FirebaseMessaging.instance.getToken();
  String fcmToken = '';

  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
    box = GetStorage();
    change(null, status: RxStatus.empty());
    myControllerEmail = TextEditingController();
    myControllerPassword = TextEditingController();
  }

  Future<void> addDevice() async {
    await firebaseMessagingToken.then((value) {
      fcmToken = value.toString();
    });
    await ListPenjemputanProvider()
        .addDevice(box.read('token'), fcmToken)
        .then((value) {
      box.write('id_device', value.data?.idDevice);
      print(box.read('id_device'));
    });
  }

  Future<void> userLogin(String email, String password) async {
    change(null, status: RxStatus.loading());
    LoginProvider().login(email, password).then(
      (resp) => {
        change(null, status: RxStatus.success()),
        box.write(Routes.token, resp.data?.token),
        box.write(Routes.userId, resp.data?.email),
        box.write(Routes.role, resp.data?.role),
        addDevice()
            .then((value) => Get.offAllNamed(Routes.home, arguments: 'login'))
      },
      onError: (err) {
        var error = err.toString();
        if (err.toString().contains('401')) {
          error = 'Email atau password salah';
        }
        if (err.toString().contains('404')) {
          error = 'Email atau password salah';
        } else {
          error = 'Error tidak diketahui';
        }
        Get.snackbar(
          'Error',
          error,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          borderRadius: 10,
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        );
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
      },
    );
  }
}
