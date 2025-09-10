import 'package:e_commerce_app/features/shopping/data/model/product_rating.dart';
import '../../domain/entity/product_entity.dart';

/*
 * ProductModel class
 * represents a product model with various attributes
 * includes methods for conversion between JSON and ProductEntity
 */
class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  /*
   * Factory constructor to create ProductModel from JSON
   * maps JSON properties to ProductModel properties
   */
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] ?? 0.0).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      rating: Rating.fromJson(json['rating'] ?? {}),
    );
  }

  /* 
   * Method to convert ProductModel to JSON
   * maps ProductModel properties to JSON properties
   */
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
    };
  }

  /*
   * Method to convert ProductModel to ProductEntity
   * maps ProductModel properties to ProductEntity properties
   */
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

  /*
   * Factory constructor to create ProductModel from ProductEntity
   * maps ProductEntity properties to ProductModel properties
   */
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      description: entity.description,
      category: entity.category,
      image: entity.image,
      rating: Rating(rate: entity.rate, count: entity.count),
    );
  }
}
