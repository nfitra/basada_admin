import 'package:get/get.dart';
import 'package:basada_admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              80.verticalSpace,
              Stack(
                children: [
                  Image.asset('assets/images/ic_basada_light.png'),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/images/ic_login.png'),
                  ),
                ],
              ),
              20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                      controller: controller.myControllerEmail,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "your email",
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  const Text(
                    "password",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Obx(() {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        cursorColor: Colors.green,
                        controller: controller.myControllerPassword,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: Colors.grey,
                            icon: controller.isPasswordHidden.value
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.remove_red_eye_outlined),
                            onPressed: () {
                              controller.isPasswordHidden.toggle();
                            },
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "your password",
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }),
                  23.verticalSpace,
                  controller.obx(
                    (state) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MaterialButton(
                        minWidth: 1.sw,
                        height: 54.h,
                        color: green,
                        onPressed: () {
                          controller.userLogin(
                            controller.myControllerEmail.text,
                            controller.myControllerPassword.text,
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onLoading: const Center(
                      child: CircularProgressIndicator(
                        color: green,
                      ),
                    ),
                    onEmpty: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MaterialButton(
                        minWidth: 1.sw,
                        height: 54.h,
                        color: green,
                        onPressed: () {
                          controller.userLogin(
                            controller.myControllerEmail.text,
                            controller.myControllerPassword.text,
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onError: (error) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MaterialButton(
                        minWidth: 1.sw,
                        height: 54.h,
                        color: green,
                        onPressed: () {
                          controller.userLogin(
                            controller.myControllerEmail.text,
                            controller.myControllerPassword.text,
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  23.verticalSpace,
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
