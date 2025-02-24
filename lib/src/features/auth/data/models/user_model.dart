import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String email;
  String? password;
  final String mobile;
  String? username;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? imageURL;

  @JsonKey(name: 'first_name')
  final String firstName;

  UserModel({
    required this.email,
    this.password = '',
    required this.mobile,
    this.username = '',
    this.lastName = '',
    required this.firstName,
    this.imageURL,
  });

  // Factory constructor for creating a new `UserModel` instance from a map.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Method for converting a `UserModel` instance to a map.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel(email: $email, password: $password, mobile: $mobile, username: $username, lastName: $lastName, firstName: $firstName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.email == email &&
        other.password == password &&
        other.mobile == mobile &&
        other.username == username &&
        other.lastName == lastName &&
        other.firstName == firstName;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        mobile.hashCode ^
        username.hashCode ^
        lastName.hashCode ^
        firstName.hashCode;
  }
}
