import 'package:basada_admin/app/routes/app_pages.dart';
import 'package:basada_admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
      body: SingleChildScrollView(
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
            Container(
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
                    offset: const Offset(0, 3), // changes position of shadow
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
                        "Total Penjemputan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: white),
                      ),
                      10.verticalSpace,
                      Text(
                        "75/100",
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
                    percent: 0.7,
                    center: Text(
                      "75%",
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
            ),
            26.verticalSpace,
            Text(
              "Tugas Penjemputan",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 12.sp, color: green),
            ),
            10.verticalSpace,
            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                        isThreeLine: true,
                        onTap: () => Get.toNamed(Routes.DETAIL),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(0),
                            vertical: ScreenUtil().setHeight(0)),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: Image.network(
                            'https://picsum.photos/100/100',
                            width: 50.w,
                            height: 100.h,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        title: const Text("Botol Kaca"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jl. Jalan Kita no.9",
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                            5.verticalSpace,
                            const Text(
                              "Rp.18.000",
                              style: TextStyle(color: green),
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              index % 2 == 0
                                  ? "Menunggu \nKonfirmasi"
                                  : "Ditolak",
                              style: TextStyle(
                                  color: index % 2 == 0 ? green : red,
                                  fontSize: 9.sp),
                            ),
                          ],
                        )).paddingSymmetric(
                      horizontal: 10.w,
                    ),
                  );
                }),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }

  Row petugasInfo() {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(17.r),
            child: Image.network(
              'https://picsum.photos/50/50',
              width: 48.w,
              height: 48.h,
            )),
        SizedBox(width: ScreenUtil().setWidth(10)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Parker Sudrajat",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.bold,
              ),
            ),
            5.verticalSpace,
            Text(
              "Petugas Lapangan",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(12), color: Colors.grey[400]),
            ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.notifications_active_rounded, color: green)
      ],
    );
  }
}
