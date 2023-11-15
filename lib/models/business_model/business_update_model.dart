import 'dart:io';

class MerchantUpdateModel {
  String categoryId;
  String name;
  dynamic email;
  String mobile;
  String alternateMobile;
  String gstNo;
  String address;
  String bankName;
  String bankAccountName;
  String bankAccountNumber;
  String accountType;
  String ifscCode;
  dynamic aadharProof;
  dynamic panProof;
  dynamic locationAddress;
  dynamic videoLink;
  

  MerchantUpdateModel({
    required this.categoryId,
    required this.name,
    this.email,
    required this.mobile,
    required this.alternateMobile,
    required this.gstNo,
    required this.address,
    required this.accountType,
    required this.bankAccountName,
    required this.bankAccountNumber,
    required this.bankName,
    required this.ifscCode,

     this.aadharProof,
     this.panProof,
     this.locationAddress,
    this.videoLink,
  });
}
