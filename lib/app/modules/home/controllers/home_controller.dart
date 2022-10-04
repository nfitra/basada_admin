import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    FlutterNativeSplash.remove();
    final regId = await FirebaseMessaging.instance.getToken();
    print(regId);
    print("created");
  }

  void increment() => count.value++;
}
