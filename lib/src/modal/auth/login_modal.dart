class ModalLogin {
  final int userId;
  final String name, email, dialCode, mobileNumber;

  ModalLogin(
      {required this.email,
      required this.name,
      required this.userId,
      required this.mobileNumber,
      required this.dialCode});

  factory ModalLogin.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'user_id': int userId,
        'name': String name,
        'email': String email,
        'mobile_number': String mobileNumber,
        'dial_code': String dialCode
      } =>
        ModalLogin(
            userId: userId,
            name: name,
            email: email,
            mobileNumber: mobileNumber,
            dialCode: dialCode),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
