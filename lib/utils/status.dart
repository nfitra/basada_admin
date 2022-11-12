import 'package:flutter/material.dart';

String getStatus(String status) {
  switch (status) {
    case 'Menunggu Petugas Datang':
      return 'Menunggu Petugas';
    case 'Request anda telah ditolak':
      return 'Ditolak';
    case 'Uang sampah telah masuk':
      return 'Selesai';
    case 'Sampah Belum Dikonfirmasi':
      return 'Menunggu Konfirmasi';
    default:
      return '-';
  }
}

Color getStatusColor(String status) {
  switch (status) {
    case 'Menunggu Petugas Datang':
      return Colors.orange;
    case 'Request anda telah ditolak':
      return Colors.red;
    case 'Uang sampah telah masuk':
      return Colors.green;
    case 'Sampah Belum Dikonfirmasi':
      return Colors.blue;
    default:
      return Colors.blue;
  }
}
