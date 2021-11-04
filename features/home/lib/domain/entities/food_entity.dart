import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final String id;
  final String title;
  final String image;
  final String desc;
  final bool isFav;
  const FoodEntity(
      {required this.id,
      required this.title,
      required this.image,
      required this.desc,
      this.isFav = false});

  @override
  List<Object?> get props => [id, title, image, desc];
}
