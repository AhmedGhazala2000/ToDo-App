class RegisterRequestModel {
  final String phone;
  final String password;
  final String displayName;
  final num experienceYears;
  final String address;
  final String level;

  RegisterRequestModel({
    required this.phone,
    required this.password,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['password'] = password;
    map['displayName'] = displayName;
    map['experienceYears'] = experienceYears;
    map['address'] = address;
    map['level'] = level;
    return map;
  }
}
