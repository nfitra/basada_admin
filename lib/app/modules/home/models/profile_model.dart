class ProfileModel {
  String? sId;
  String? unName;
  dynamic unEst;
  dynamic unSk;
  dynamic unStatus;
  dynamic unAddress;
  dynamic unLocation;
  dynamic unDistrict;
  dynamic unEmployees;
  dynamic unManager;
  dynamic unContact;
  String? unDailyQuota;
  String? fkAuth;

  ProfileModel(
      {this.sId,
      this.unName,
      this.unEst,
      this.unSk,
      this.unStatus,
      this.unAddress,
      this.unLocation,
      this.unDistrict,
      this.unEmployees,
      this.unManager,
      this.unContact,
      this.unDailyQuota,
      this.fkAuth});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    unName = json['un_name'];
    unEst = json['un_est'];
    unSk = json['un_sk'];
    unStatus = json['un_status'];
    unAddress = json['un_address'];
    unLocation = json['un_location'];
    unDistrict = json['un_district'];
    unEmployees = json['un_employees'];
    unManager = json['un_manager'];
    unContact = json['un_contact'];
    unDailyQuota = json['un_daily_quota'];
    fkAuth = json['fk_auth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['un_name'] = unName;
    data['un_est'] = unEst;
    data['un_sk'] = unSk;
    data['un_status'] = unStatus;
    data['un_address'] = unAddress;
    data['un_location'] = unLocation;
    data['un_district'] = unDistrict;
    data['un_employees'] = unEmployees;
    data['un_manager'] = unManager;
    data['un_contact'] = unContact;
    data['un_daily_quota'] = unDailyQuota;
    data['fk_auth'] = fkAuth;
    return data;
  }
}
