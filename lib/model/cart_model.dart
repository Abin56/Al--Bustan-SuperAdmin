// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartModel {
  String docId;
  String barcodeNumber;
  String productname;
  int inPrice;
  int outPrice;
  int totalAmount;
  int quantity;
  int availablequantityinStock;
  String productDetailsDocId;
  CartModel(
      {required this.docId,
      required this.barcodeNumber,
      required this.productname,
      required this.inPrice,
      required this.outPrice,
      required this.totalAmount,
      required this.quantity,
      required this.availablequantityinStock,
      required this.productDetailsDocId});

  CartModel copyWith(
      {String? docId,
      String? barcodeNumber,
      String? productname,
      int? inPrice,
      int? outPrice,
      int? totalAmount,
      int? quantity,
      int? availablequantityinStock,
      String? productDetailsDocId}) {
    return CartModel(
        docId: docId ?? this.docId,
        barcodeNumber: barcodeNumber ?? this.barcodeNumber,
        productname: productname ?? this.productname,
        inPrice: inPrice ?? this.inPrice,
        outPrice: outPrice ?? this.outPrice,
        totalAmount: totalAmount ?? this.totalAmount,
        quantity: quantity ?? this.quantity,
        availablequantityinStock:
            availablequantityinStock ?? this.availablequantityinStock,
        productDetailsDocId: productDetailsDocId ?? this.productDetailsDocId);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'barcodeNumber': barcodeNumber,
      'productname': productname,
      'inPrice': inPrice,
      'outPrice': outPrice,
      'quantity': quantity,
      'totalAmount': totalAmount,
      'availableQuantity': availablequantityinStock,
      'productDetailsDocId': productDetailsDocId
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
        docId: map['docId'] ?? '',
        barcodeNumber: map['barcodeNumber'] ?? '',
        productname: map['productname'] ?? '',
        inPrice: map['inPrice'] ?? 0,
        outPrice: map['outPrice'] ?? 0,
        quantity: map['quantity'] ?? 0,
        totalAmount: map['totalAmount'] ?? 0,
        availablequantityinStock: map['availableQuantity'] ?? 0,
        productDetailsDocId: map['productDetailsDocId'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(docId: $docId, barcodeNumber: $barcodeNumber, productname: $productname, inPrice: $inPrice, outPrice: $outPrice, quantityinStock: $availablequantityinStock,totalAmount:$totalAmount,productDetailsDocId:$productDetailsDocId)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.docId == docId &&
        other.barcodeNumber == barcodeNumber &&
        other.productname == productname &&
        other.inPrice == inPrice &&
        other.outPrice == outPrice &&
        other.quantity == quantity &&
        other.totalAmount == totalAmount &&
        other.availablequantityinStock == availablequantityinStock &&
        other.productDetailsDocId == productDetailsDocId;
  }

  @override
  int get hashCode {
    return docId.hashCode ^
        barcodeNumber.hashCode ^
        productname.hashCode ^
        inPrice.hashCode ^
        outPrice.hashCode ^
        quantity.hashCode ^
        totalAmount.hashCode ^
        availablequantityinStock.hashCode ^
        productDetailsDocId.hashCode;
  }
}
