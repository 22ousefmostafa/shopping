class ProductModel {
  final String id;
  final String title;
  final double price;
  final double? discountPrice;
  final double rating;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    this.discountPrice,
    required this.rating,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? json['id'] ?? '',
      title: json['title'] ?? 'Product',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPrice: json['discountPrice'] != null
          ? (json['discountPrice'] as num).toDouble()
          : null,
      rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
      image:
          json['thumbnail'] ??
          json['image'] ??
          'https://via.placeholder.com/150',
    );
  }
}
