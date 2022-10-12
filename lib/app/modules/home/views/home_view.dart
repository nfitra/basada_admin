import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:basada_admin/app/routes/app_pages.dart';
import 'package:basada_admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../utils/status.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Image.asset('assets/images/ic_basada_green.png'),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getDataPenjemputan();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              26.verticalSpace,
              petugasInfo(),
              26.verticalSpace,
              Text(
                "OVERVIEW",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12.sp, color: green),
              ),
              20.verticalSpace,
              Obx(() => Container(
                    height: 120.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Progress",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: white),
                            ),
                            10.verticalSpace,
                            Text(
                              "Quota hari ini",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: white),
                            ),
                            10.verticalSpace,
                            Text(
                              "${controller.profile.value.unDailyQuota} /10",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.sp,
                                  color: white),
                            ),
                          ],
                        ),
                        CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: int.parse(
                                  controller.profile.value.unDailyQuota ??
                                      "0") /
                              10,
                          center: Text(
                            "${int.parse(controller.profile.value.unDailyQuota ?? "0") * 10}%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: white),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: white,
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 20.h),
                  )),
              26.verticalSpace,
              Text(
                "Tugas Penjemputan",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12.sp, color: green),
              ),
              10.verticalSpace,
              controller.obx(
                (state) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.dataPenjemputan.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                            isThreeLine: true,
                            onTap: () => controller.navigateAndRefresh(
                                controller.dataPenjemputan[index].sId),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(0),
                                vertical: ScreenUtil().setHeight(0)),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: CachedNetworkImage(
                                imageUrl: Routes.BASE_URL +
                                    controller.dataPenjemputan[index].rImage!,
                                placeholder: (context, url) => Image.asset(
                                  'assets/images/ic_basada_green.png',
                                  height: 50.h,
                                  width: 50.w,
                                ),
                                width: 50.w,
                                height: 100.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              controller.dataPenjemputan[index].jenisSampah!
                                  .toLowerCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: green),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller
                                      .dataPenjemputan[index].jadwalJemput!,
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                5.verticalSpace,
                                Text(
                                  controller.dataPenjemputan[index].namaNasabah!
                                      .toLowerCase(),
                                  style: const TextStyle(color: green),
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  getStatus(controller
                                      .dataPenjemputan[index].keterangan!),
                                  style: TextStyle(
                                      color: getStatusColor(controller
                                          .dataPenjemputan[index].keterangan!),
                                      fontSize: 9.sp),
                                ),
                              ],
                            )).paddingSymmetric(
                          horizontal: 10.w,
                        ),
                      );
                    }),
                onLoading: const Center(
                  child: CircularProgressIndicator(),
                ),
                onEmpty: const Center(
                  child: Text("Tidak ada data"),
                ),
                onError: (error) => Center(
                  child: Text(error.toString()),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }

  Row petugasInfo() {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(17.r),
            child: Image.network(
              'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
              width: 48.w,
              height: 48.h,
            )),
        SizedBox(width: ScreenUtil().setWidth(10)),
        Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.profile.value.unName ?? "no data",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              5.verticalSpace,
              Text(
                controller.profile.value.fkAuth ?? "no data",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(12), color: Colors.grey[400]),
              ),
            ],
          );
        }),
        const Spacer(),
        IconButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Apakah anda yakin ingin logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('Tidak'),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                        controller.logout();
                      },
                      child: const Text('Ya'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.logout_rounded, color: green))
      ],
    );
  }
}
