class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productsCount,
  });

  /// Helper function to return empty BrandModel
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /// Function to convert BrandModel to JSON format for saving to Firebase
  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'productsCount': productsCount,
    };
  }

  /// To convert Map of document snapshot JSON to BrandModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['id'] ?? '',
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      isFeatured: data['isFeatured'],
      productsCount: data['productsCount'],
    );
  }
}
