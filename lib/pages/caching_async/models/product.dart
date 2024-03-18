import 'dart:convert';

import 'package:flutter/foundation.dart';

class Products {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;
  Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  Products copyWith({
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return Products(
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'products': products.map((x) => x.toMap()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      products: List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
      total: map['total']?.toInt() ?? 0,
      skip: map['skip']?.toInt() ?? 0,
      limit: map['limit']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) => Products.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Products(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Products &&
      listEquals(other.products, products) &&
      other.total == total &&
      other.skip == skip &&
      other.limit == limit;
  }

  @override
  int get hashCode {
    return products.hashCode ^
      total.hashCode ^
      skip.hashCode ^
      limit.hashCode;
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    int? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toInt() ?? 0,
      discountPercentage: map['discountPercentage']?.toDouble() ?? 0.0,
      rating: map['rating']?.toDouble() ?? 0.0,
      stock: map['stock']?.toInt() ?? 0,
      brand: map['brand'] ?? '',
      category: map['category'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.price == price &&
      other.discountPercentage == discountPercentage &&
      other.rating == rating &&
      other.stock == stock &&
      other.brand == brand &&
      other.category == category &&
      other.thumbnail == thumbnail &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      discountPercentage.hashCode ^
      rating.hashCode ^
      stock.hashCode ^
      brand.hashCode ^
      category.hashCode ^
      thumbnail.hashCode ^
      images.hashCode;
  }
}