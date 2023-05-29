import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe/src/domain/entities/user.dart';

part 'user_interface.freezed.dart';

@freezed
abstract class UserInterfaceFailure with _$UserInterfaceFailure {
  const factory UserInterfaceFailure.undefined() = UndefinedUserInterfaceFailure;
}

abstract class UserInterface {
  Future<Either<UserInterfaceFailure, User>> getById();
}