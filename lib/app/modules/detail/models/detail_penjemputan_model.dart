class DetailPenjemputan {
  String? sId;
  String? rDate;
  String? fkGarbage;
  String? jenisSampah;
  String? namaAdmin;
  String? namaNasabah;
  String? rWeight;
  String? rImage;
  String? rNotes;
  dynamic rPickupDate;
  String? location;
  String? jadwalJemput;
  String? harga;
  String? keterangan;

  DetailPenjemputan(
      {this.sId,
      this.rDate,
      this.fkGarbage,
      this.jenisSampah,
      this.namaAdmin,
      this.namaNasabah,
      this.rWeight,
      this.rImage,
      this.rNotes,
      this.rPickupDate,
      this.location,
      this.jadwalJemput,
      this.harga,
      this.keterangan});

  DetailPenjemputan.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rDate = json['r_date'];
    fkGarbage = json['fk_garbage'];
    jenisSampah = json['jenis_sampah'];
    namaAdmin = json['nama_admin'];
    namaNasabah = json['nama_nasabah'];
    rWeight = json['r_weight'];
    rImage = json['r_image'];
    rNotes = json['r_notes'];
    rPickupDate = json['r_pickup_date'];
    location = json['location'];
    jadwalJemput = json['jadwal_jemput'];
    harga = json['harga'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['r_date'] = rDate;
    data['fk_garbage'] = fkGarbage;
    data['jenis_sampah'] = jenisSampah;
    data['nama_admin'] = namaAdmin;
    data['nama_nasabah'] = namaNasabah;
    data['r_weight'] = rWeight;
    data['r_image'] = rImage;
    data['r_notes'] = rNotes;
    data['r_pickup_date'] = rPickupDate;
    data['location'] = location;
    data['jadwal_jemput'] = jadwalJemput;
    data['harga'] = harga;
    data['keterangan'] = keterangan;
    return data;
  }
}
