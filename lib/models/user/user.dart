import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String surname,
    @Default('') String street,
    @Default('') String zipCode,
    @Default('') String town,
    required String email,
    @JsonKey(includeFromJson: false, includeToJson: false) String? password,
  }) = _User;

  factory User.pure() {
    return const User(
      id: '',
      name: '',
      surname: '',
      email: '',
      password: '',
    );
  }

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
