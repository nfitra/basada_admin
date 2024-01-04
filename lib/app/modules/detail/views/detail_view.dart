import 'package:basada_admin/utils/colors.dart';
import 'package:basada_admin/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../routes/app_pages.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;
    void onMapCreated(GoogleMapController controller) {
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
      body: controller.obx(
        (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                Routes.baseUrl + controller.detail.value.rImage!,
                height: .25.sh,
                width: 400.w,
                fit: BoxFit.cover,
              ),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '${controller.detail.value.jenisSampah}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      editJenisSampah();
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: green,
                    ))
              ],
            ),
            Row(
              children: [
                Text(
                  'Rp. ${controller.usCurrency.format(int.parse(controller.detail.value.harga.toString()))}',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ),
                10.horizontalSpace,
                Text(
                  'Berat total : ${controller.detail.value.rWeight} Kg',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
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
                      '${controller.detail.value.namaNasabah}',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
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
            Obx(() {
              return Text(
                controller.alamat.value,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                ),
              );
            }),
            10.verticalSpace,
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
                          Column(
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
                                "${controller.detail.value.jadwalJemput}",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  fontWeight: FontWeight.normal,
                                  color: grey,
                                ),
                              ),
                              18.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        "${controller.detail.value.rWeight} Kg",
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
                                      editBeratSampah();
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: green,
                                    ),
                                  ),
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
                                "${controller.detail.value.rNotes}",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  fontWeight: FontWeight.normal,
                                  color: grey,
                                ),
                              ),
                              20.verticalSpace,
                              actionButton(getStatus(
                                  controller.detail.value.keterangan!)),
                            ],
                          ),
                          Obx(
                            () {
                              return SizedBox(
                                width: 1.sw,
                                height: 200.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: controller.latLng.value !=
                                          const LatLng(0, 0)
                                      ? GoogleMap(
                                          initialCameraPosition: CameraPosition(
                                            target: controller.latLng.value,
                                            zoom: 18.0,
                                          ),
                                          markers: <Marker>{
                                            Marker(
                                              markerId: const MarkerId("1"),
                                              position: controller.geoToLatlong(
                                                controller.detail.value.location
                                                    .toString(),
                                              ),
                                            )
                                          },
                                        )
                                      : Center(
                                          child: Text("Lokasi tidak ditemukan"),
                                        ),
                                ).paddingOnly(top: 5.h),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 25.w),
      ),
    );
  }

  Widget actionButton(String status) {
    if (status == "Selesai") {
      return Center(
        child: Text(
          "Penjualan Telah Selesai!",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            fontWeight: FontWeight.bold,
            color: green,
          ),
        ),
      );
    }
    if (status == "Ditolak") {
      return Center(
        child: Text(
          "Penjualan Ditolak!",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            fontWeight: FontWeight.bold,
            color: red,
          ),
        ),
      );
    }
    if (status == "Menunggu Konfirmasi") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () async {
              Get.dialog(
                AlertDialog(
                  title: const Text("Konfirmasi Penjemputan"),
                  content: Text(
                      "Apakah anda yakin ingin mengkonfirmasi penjemputan sampah?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Tidak"),
                    ),
                    TextButton(
                      onPressed: () async {
                        controller.rejectRequest(
                            controller.idPenjualan,
                            controller.idSampah.value,
                            controller.beratSampahController.text);
                        Get.back();
                      },
                      child: const Text("Ya"),
                    ),
                  ],
                ),
              );
            },
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
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text("Konfirmasi Penjemputan"),
                  content: Text(
                      "Apakah anda yakin ingin mengkonfirmasi penjemputan sampah?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Tidak"),
                    ),
                    TextButton(
                      onPressed: () async {
                        controller.confirmRequest(
                            controller.idPenjualan,
                            controller.idSampah.value,
                            controller.beratSampahController.text);
                        Get.back();
                      },
                      child: const Text("Ya"),
                    ),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: blue,
              minimumSize: Size(148.w, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              "Jemput",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.normal,
                color: white,
              ),
            ),
          ),
        ],
      );
    }

    if (status == "Menunggu Petugas") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () async {
              Get.dialog(
                AlertDialog(
                  title: Text("Batalkan Penjemputan?"),
                  content: Text(
                      "Apakah anda yakin ingin membatalkan penjemputan sampah?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Tidak"),
                    ),
                    TextButton(
                      onPressed: () async {
                        controller.rejectRequest(
                            controller.idPenjualan,
                            controller.idSampah.value,
                            controller.beratSampahController.text);
                        Get.back();
                      },
                      child: Text("Ya"),
                    ),
                  ],
                ),
              );
            },
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
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text("Konfirmasi Selesai"),
                  content: Text(
                      "Apakah anda yakin ingin menyelesaikan penjemputan sampah?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Tidak"),
                    ),
                    TextButton(
                      onPressed: () async {
                        controller.doneRequest(
                            controller.idPenjualan,
                            controller.idSampah.value,
                            controller.beratSampahController.text);
                        Get.back();
                      },
                      child: const Text("Ya"),
                    ),
                  ],
                ),
              );
            },
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
          )
        ],
      );
    } else {
      return Center(
        child: Text(
          "Penjualan Dibatalkan!",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            fontWeight: FontWeight.bold,
            color: red,
          ),
        ),
      );
    }
  }

  void editJenisSampah() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Text(
              "Edit Jenis Sampah",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                fontWeight: FontWeight.bold,
              ),
            ),
            20.verticalSpace,
            Obx(() {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: greyLight,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  items: controller.jenisSampah.value
                      .map((e) => DropdownMenuItem(
                            value: e.jName,
                            child: Text(
                              e.jName ?? "",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedJenisSampah.value = value.toString();
                    controller.idSampahTemp.value = controller.jenisSampah.value
                        .firstWhere((element) => element.jName == value)
                        .sId!;
                    controller.idSampah.value = controller.idSampahTemp.value;
                  },
                  value: controller.selectedJenisSampah.value,
                ),
              );
            }),
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
                    "Batal",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.normal,
                      color: white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateBeratSampah(controller.idSampahTemp.value);
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    minimumSize: Size(148.w, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    "Simpan",
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
        ).paddingSymmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
      ),
    );
  }

  void editBeratSampah() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Text(
              "Edit Berat Sampah",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                fontWeight: FontWeight.bold,
              ),
            ),
            20.verticalSpace,
            Container(
              height: 50.h,
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: greyLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.beratSampahController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Masukkan Berat Sampah",
                ),
              ),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    minimumSize: Size(148.w, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    "Batal",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.normal,
                      color: white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateBeratSampah(controller.idSampahTemp.value);
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    minimumSize: Size(148.w, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    "Simpan",
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
        ).paddingSymmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
      ),
    );
  }
}
