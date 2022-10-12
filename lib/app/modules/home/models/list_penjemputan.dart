class ListPenjemputan {
  String? sId;
  String? rDate;
  String? jenisSampah;
  String? namaAdmin;
  String? namaNasabah;
  String? rWeight;
  String? rImage;
  String? jadwalJemput;
  String? harga;
  String? keterangan;

  ListPenjemputan(
      {this.sId,
      this.rDate,
      this.jenisSampah,
      this.namaAdmin,
      this.namaNasabah,
      this.rWeight,
      this.rImage,
      this.jadwalJemput,
      this.harga,
      this.keterangan});

  ListPenjemputan.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rDate = json['r_date'];
    jenisSampah = json['jenis_sampah'];
    namaAdmin = json['nama_admin'];
    namaNasabah = json['nama_nasabah'];
    rWeight = json['r_weight'];
    rImage = json['r_image'];
    jadwalJemput = json['jadwal_jemput'];
    harga = json['harga'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['r_date'] = rDate;
    data['jenis_sampah'] = jenisSampah;
    data['nama_admin'] = namaAdmin;
    data['nama_nasabah'] = namaNasabah;
    data['r_weight'] = rWeight;
    data['r_image'] = rImage;
    data['jadwal_jemput'] = jadwalJemput;
    data['harga'] = harga;
    data['keterangan'] = keterangan;
    return data;
  }
}
