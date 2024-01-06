class DeliveryModel {
  final String productname;
  final String productprice;
  final String imageUrl;

  DeliveryModel({
    required this.productname,
    required this.productprice,
    required this.imageUrl,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      productname: json['productname'] ?? '',
      productprice: (json['productprice'] ?? 0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productname': productname,
      'productprice': productprice,
      'imageUrl': imageUrl,
    };
  }

  static List<DeliveryModel> product = [
    DeliveryModel(
      productname: 'a',
      productprice: "10",
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D',
    ),
    DeliveryModel(
      productname: 'b',
      productprice: "12",
      imageUrl:
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
    ),
  ];
}
