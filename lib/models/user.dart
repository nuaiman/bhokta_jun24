class User {
  final String id;
  final String fullName;
  final String profileUrl;
  final String fatherName;
  final String motherName;
  final DateTime birthDate;
  final String gender;
  final String profession;
  final int nidNumber;
  final int passportNumber;
  final int birthCertificateNumber;
  final String fullAddress;
  final String division;
  final String district;
  final String postalCode;
  final List<String> complains;
  final bool agreedToTermsAndConditions;
  User({
    required this.id,
    required this.fullName,
    required this.profileUrl,
    required this.fatherName,
    required this.motherName,
    required this.birthDate,
    required this.gender,
    required this.profession,
    required this.nidNumber,
    required this.passportNumber,
    required this.birthCertificateNumber,
    required this.fullAddress,
    required this.division,
    required this.district,
    required this.postalCode,
    required this.complains,
    required this.agreedToTermsAndConditions,
  });
}
