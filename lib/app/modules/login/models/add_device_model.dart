class AddDeviceModel {
  int? status;
  Data? data;

  AddDeviceModel({this.status, this.data});

  AddDeviceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? idDevice;
  String? message;

  Data({this.idDevice, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    idDevice = json['id_device'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_device'] = idDevice;
    data['message'] = message;
    return data;
  }
}
