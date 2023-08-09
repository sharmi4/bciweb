class MemberProfileUpdateModel {
  String name;
  String email;
  String mobile;
  dynamic occupation;
  dynamic fatherName;
  dynamic motherName;
  dynamic dateOfBirth;
 dynamic isMarried;
 dynamic marrigedate;
 dynamic qulification;
 dynamic gstno;
 dynamic panNo;
 dynamic aadharno;
 dynamic branch;
 dynamic spouse;
 dynamic children;

  MemberProfileUpdateModel(
      {required this.name,
      required this.email,
      required this.occupation,
      required this.fatherName,
      required this.motherName,
      required this.mobile,
      required this.dateOfBirth,
      required this.isMarried,
      required this.aadharno,
      required this.branch,
      required this.children,
      required this.gstno,
      required this.marrigedate,
      required this.panNo,
      required this.qulification,
       required this.spouse});
}
