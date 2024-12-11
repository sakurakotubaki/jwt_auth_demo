import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String email,
    @Default([]) List<Book> books,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Book with _$Book {
  const factory Book({
    required int id,
    required String title,
    required String description,
    @JsonKey(name: 'owner_id') required int ownerId,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String username,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String username,
    required String email,
    required String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}
