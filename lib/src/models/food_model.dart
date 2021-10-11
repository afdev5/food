class FoodModel {
  final String id;
  final String title;
  final String image;
  final String desc;
  final bool isFav;

  FoodModel({this.id, this.title, this.image, this.desc, this.isFav = false});

  FoodModel copyWith({String id, String title, String image, String desc, bool isFav}) {
    return FoodModel(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        desc: desc ?? this.desc,
        isFav: isFav ?? this.isFav
        );
  }

  Map<String, dynamic> toMap() {
    return {
      'idMeal': this.id,
      'strMeal': this.title,
      'strMealThumb': this.image,
      'strInstructions': this.desc
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
        id: map['idMeal'].toString(),
        title: map['strMeal'],
        image: map['strMealThumb'],
        desc: map['strInstructions']);
  }
}
