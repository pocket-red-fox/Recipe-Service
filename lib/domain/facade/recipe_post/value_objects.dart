import 'package:dartz/dartz.dart';
import 'package:recipe_service/domain/core/value_failure.dart';
import 'package:recipe_service/domain/core/value_object.dart';
import 'package:recipe_service/domain/core/value_validators.dart';

class PostTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PostTitle(String input) {
    return PostTitle._(
      validateStringNotEmpty(input).flatMap(validateSingleLine),
    );
  }

  const PostTitle._(this.value);
}

class PostImage extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PostImage(String input) {
    return PostImage._(
      validateStringNotEmpty(input).flatMap(validateSingleLine),
    );
  }

  const PostImage._(this.value);
}

class PostData extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PostData(String input) {
    return PostData._(
      validateStringNotEmpty(input),
    );
  }

  const PostData._(this.value);
}
