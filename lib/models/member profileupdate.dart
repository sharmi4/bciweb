class MemberProfileUpdateModel {
  String name;
  String email;
  String mobile;
  dynamic occupation;
  dynamic fatherName;
  dynamic motherName;
  dynamic dateOfBirth;
 dynamic isMarried;

  MemberProfileUpdateModel(
      {required this.name,
      required this.email,
      required this.occupation,
      required this.fatherName,
      required this.motherName,
      required this.mobile,
      required this.dateOfBirth,
      required this.isMarried});
}
