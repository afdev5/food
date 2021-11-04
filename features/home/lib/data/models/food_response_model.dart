class FoodResponseModel {
  FoodResponseModel({
    required this.message,
    required this.error,
    required this.data,
  });

  String message;
  bool error;
  // FoodModel data;
  List<FoodModel> data;

  factory FoodResponseModel.fromJson(Map<String, dynamic> json) => FoodResponseModel(
        message: json['message'],
        error: json['error'],
        // data: FoodModel.fromMap(json['data']),
        data: List<FoodModel>.from(
            json['meals'].map((x) => FoodModel.fromMap(x))),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'error': error,
        // 'data': data.toMap(),
        'meals': data.map((e) => e.toMap()).toList()
      };
}

class FoodModel {
  final String? id;
  final String? title;
  final String? image;
  final String? desc;
  final bool? isFav;

  FoodModel({this.id, this.title, this.image, this.desc, this.isFav = false});

  FoodModel copyWith({String? id, String? title, String? image, String? desc, bool? isFav}) {
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
      'idMeal': id,
      'strMeal': title,
      'strMealThumb': image,
      'strInstructions': desc
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