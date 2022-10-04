import 'package:basada_admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Penjualan'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.w),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              'assets/images/plastic.jpg',
              height: 200.h,
              width: 400.w,
              fit: BoxFit.cover,
            ),
          ),
          20.verticalSpace,
          Text(
            'Botol Plastik',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Harga per Kg : Rp 3.000',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.normal,
              color: grey,
            ),
          ),
          5.verticalSpace,
          Row(
            children: [
              Text(
                'Rp 18.000',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              10.horizontalSpace,
              Text(
                'Berat total : 6 kg',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20.w,
                backgroundColor: greyLight,
                child: Image.asset(
                  'assets/images/ic_login.png',
                  width: 32.w,
                  height: 32.h,
                ),
              ),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ilham Fajar',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    '081234567890',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.normal,
                      color: grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.call,
                color: green,
              ),
            ],
          ),
          10.verticalSpace,
          Text(
            'Jl. Sultan Iskandar Muda no.32, Jakarta selatan. ',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(12),
            ),
          ),
          20.verticalSpace,
          Flexible(
              child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: 'Detail'),
                    Tab(text: 'Lokasi'),
                  ],
                ),
                SizedBox(
                  height: 250.h,
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            Text(
                              "Tanggal Penjemputan",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              "12 April 2021",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                fontWeight: FontWeight.normal,
                                color: grey,
                              ),
                            ),
                            18.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Berat Setelah Diperiksa",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    9.verticalSpace,
                                    Text(
                                      "Rp 17.000 (5 kg)",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(18),
                                        fontWeight: FontWeight.bold,
                                        color: green,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      Get.bottomSheet(
                                        backgroundColor: Colors.transparent,
                                        Container(
                                          height: 230.h,
                                          width: 1.sw,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.r),
                                              topRight: Radius.circular(10.r),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              10.verticalSpace,
                                              Text(
                                                "Edit Berat Sampah",
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(14),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              20.verticalSpace,
                                              Container(
                                                height: 50.h,
                                                width: 1.sw,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                decoration: BoxDecoration(
                                                  color: greyLight,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "5 kg",
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(14),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.add,
                                                        color: green,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.remove,
                                                        color: green,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              20.verticalSpace,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: red,
                                                      minimumSize:
                                                          Size(148.w, 50.h),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Batal",
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: white,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: green,
                                                      minimumSize:
                                                          Size(148.w, 50.h),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Simpan",
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ).paddingSymmetric(
                                            horizontal: 30.w,
                                            vertical: 20.h,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: green,
                                    )),
                              ],
                            ),
                            10.verticalSpace,
                            Text(
                              "Catatan",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              "Botol plastik sudah di cuci",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                fontWeight: FontWeight.normal,
                                color: grey,
                              ),
                            ),
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: red,
                                    minimumSize: Size(148.w, 50.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Text(
                                    "Batalkan Penjemputan",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(12),
                                      fontWeight: FontWeight.normal,
                                      color: white,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: green,
                                    minimumSize: Size(148.w, 50.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Text(
                                    "Selesai",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(12),
                                      fontWeight: FontWeight.normal,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: const GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(45.521563, -122.677433),
                              zoom: 11.0,
                            ),
                          ),
                        ).paddingOnly(top: 5.h),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ).paddingSymmetric(horizontal: 25.w),
    );
  }
}
