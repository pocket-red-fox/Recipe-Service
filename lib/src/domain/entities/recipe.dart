import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String name;
  final String image;
  final String ownerID;

  const Recipe({
    required this.name,
    required this.image,
    required this.ownerID,
  });

  @override
  List<Object?> get props => [name];
}
