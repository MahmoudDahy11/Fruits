import '../../domain/entity/product_entity.dart';

class ProductModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
  final Attributes attributes;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.attributes,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id']?.toString() ?? '',
      title: json['name']?['ar'] ?? json['title'] ?? '',
      price: (json['price'] is Map)
          ? (json['price']['value'] ?? 0).toDouble()
          : (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: (json['images'] != null && (json['images'] as List).isNotEmpty)
          ? json['images'][0]
          : (json['image'] ?? ''),
      rating: Rating.fromJson(json['reviews'] ?? {}),
      attributes: Attributes.fromJson(json['attributes'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
      'attributes': attributes.toJson(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rate: rating.rate,
      count: rating.count,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      description: entity.description,
      category: entity.category,
      image: entity.image,
      rating: Rating(rate: entity.rate, count: entity.count),
      attributes: Attributes(
        calories: Calories(value: 0, unit: '', per: ''),
        organic: false,
        shelfLife: '',
      ),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['average_rating'] ?? json['rate'] ?? 0).toDouble(),
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}

class Attributes {
  final Calories calories;
  final bool organic;
  final String shelfLife;

  Attributes({
    required this.calories,
    required this.organic,
    required this.shelfLife,
  });

  factory Attributes.fromJson(json) {
    return Attributes(
      calories: Calories.fromJson(json['calories'] ?? {}),
      organic: json['organic'] ?? false,
      shelfLife: json['shelf_life'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories.toJson(),
      'organic': organic,
      'shelf_life': shelfLife,
    };
  }
}

class Calories {
  final int value;
  final String unit;
  final String per;

  Calories({required this.value, required this.unit, required this.per});

  factory Calories.fromJson(Map<String, dynamic> json) {
    return Calories(
      value: json['value'] ?? 0,
      unit: json['unit'] ?? '',
      per: json['per'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'value': value, 'unit': unit, 'per': per};
  }
}
