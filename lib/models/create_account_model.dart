

// CreateAccountModel createaccountmodelFromJson(String str)=>
// CreateAccountModel.fromJson(json.decode(str));

// String createaccountmodelToJson(CreateAccountModel data)=>
// json.encode(data.toJson());

class CreateAccountModel {
  String name;
  String dateofbirth;
  String mobilenumber;
  String email;
  String unmarried;
  String occupation;
  String fatherName;
  String motherName;
  String isMarried;
  String panNo;
  String aadharNo;
  String roleId;
  String password;
  String passwordConfirmation;
  dynamic referalcode;

  CreateAccountModel({
    required this.name,
    required this.dateofbirth,
    required this.email,
    required this.fatherName,
    required this.motherName,
    required this.isMarried,
    required this.mobilenumber,
    required this.occupation,
    required this.unmarried,
    required this.aadharNo,
    required this.panNo,
    required this.password,
    required this.passwordConfirmation,
    required this.roleId,
    required this.referalcode,
  });

//   factory  CreateAccountModel.fromJson(Map<String,dynamic>json)=>
//   CreateAccountModel(
//     name: json['jayaseelan'],
//   dateofbirth: json[''],
//   email: json['sharmilamani2025@gmail.com'],
//   fatherName:json[''],
//   motherName: json[''],
//   isMarried: json[''],
//   mobilenumber: json['98765432'],
//   occupation: json[''],
//   unmarried: json[''],
//   roleId: json[''],
//   panNo: json[''],
//   password: json[''],
//   passwordConfirmation: json[''],
//   aadharNo: json['']
//   );

// Map<String,dynamic>toJson()=>{
//   'jayaseelan':name,
//   'sharmilamani2025@gmail.com':email,
//   '98765432':mobilenumber,
// };
}

class AddressModel {
  String doorNo;
  String buildingName;
  String address;
  String city;
  String state;
  String personalId;
  String aadhrId;
  String pincode;
 

  AddressModel({
    required this.doorNo,
    required this.buildingName,
    required this.address,
    required this.city,
    required this.state,
    required this.personalId,
    required this.aadhrId,
    required this.pincode,
   
     
  });
}
