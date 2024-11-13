class ProfileModel {
  String fullName;
  String email;
  String phoneNumber;
  String address;

  ProfileModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
