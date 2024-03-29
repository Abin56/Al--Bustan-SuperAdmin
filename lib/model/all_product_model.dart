// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AllProductDetailModel {
  String docId;
  String barcodeNumber;
  String productname;
  String categoryID;
  String categoryName;
  String subcategoryID;
  String subcategoryName;
  int inPrice;
  int outPrice;
  int quantityinStock;
  String expiryDate;
  String addedDate;
  String authuid;
  String unitcategoryID;
  String unitcategoryName;
  String packageType;
  String packageTypeID;
  String companyName;
  String companyNameID;
  String returnType;
  String itemcode;
  bool outofstock;
  bool isavailable;
  bool isEdit;
  AllProductDetailModel(
      {required this.docId,
      required this.barcodeNumber,
      required this.productname,
      required this.categoryID,
      required this.categoryName,
      required this.subcategoryID,
      required this.subcategoryName,
      required this.inPrice,
      required this.outPrice,
      required this.quantityinStock,
      required this.expiryDate,
      required this.addedDate,
      required this.authuid,
      required this.unitcategoryID,
      required this.unitcategoryName,
      required this.packageType,
      required this.packageTypeID,
      required this.companyName,
      required this.companyNameID,
      required this.returnType,
      required this.itemcode,
      required this.outofstock,
      required this.isavailable,
      required this.isEdit});

  AllProductDetailModel copyWith(
      {String? docId,
      String? barcodeNumber,
      String? productname,
      String? categoryID,
      String? categoryName,
      String? subcategoryID,
      String? subcategoryName,
      int? inPrice,
      int? outPrice,
      int? quantityinStock,
      String? expiryDate,
      String? addedDate,
      String? authuid,
      String? unitcategoryID,
      String? unitcategoryName,
      String? packageType,
      String? packageTypeID,
      String? companyName,
      String? companyNameID,
      String? returnType,
      String? itemcode,
      bool? outofstock,
      bool? isavailable,
      bool? isEdit}) {
    return AllProductDetailModel(
        docId: docId ?? this.docId,
        barcodeNumber: barcodeNumber ?? this.barcodeNumber,
        productname: productname ?? this.productname,
        categoryID: categoryID ?? this.categoryID,
        categoryName: categoryName ?? this.categoryName,
        subcategoryID: subcategoryID ?? this.subcategoryID,
        subcategoryName: subcategoryName ?? this.subcategoryName,
        inPrice: inPrice ?? this.inPrice,
        outPrice: outPrice ?? this.outPrice,
        quantityinStock: quantityinStock ?? this.quantityinStock,
        expiryDate: expiryDate ?? this.expiryDate,
        addedDate: addedDate ?? this.addedDate,
        authuid: authuid ?? this.authuid,
        unitcategoryID: unitcategoryID ?? this.unitcategoryID,
        unitcategoryName: unitcategoryName ?? this.unitcategoryName,
        packageType: packageType ?? this.packageType,
        packageTypeID: packageTypeID ?? this.packageTypeID,
        companyName: companyName ?? this.companyName,
        companyNameID: companyNameID ?? this.companyNameID,
        returnType: returnType ?? this.returnType,
        itemcode: itemcode ?? this.itemcode,
        outofstock: outofstock ?? this.outofstock,
        isavailable: isavailable ?? this.isavailable,
        isEdit: isEdit ?? this.isEdit);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'barcodeNumber': barcodeNumber,
      'productname': productname,
      'categoryID': categoryID,
      'categoryName': categoryName,
      'subcategoryID': subcategoryID,
      'subcategoryName': subcategoryName,
      'inPrice': inPrice,
      'outPrice': outPrice,
      'quantityinStock': quantityinStock,
      'expiryDate': expiryDate,
      'addedDate': addedDate,
      'authuid': authuid,
      'unitcategoryID': unitcategoryID,
      'unitcategoryName': unitcategoryName,
      'packageType': packageType,
      'packageTypeID': packageTypeID,
      'companyName': companyName,
      'companyNameID': companyNameID,
      'returnType': returnType,
      'itemcode': itemcode,
      'outofstock': outofstock,
      'isavailable': isavailable,
      'isedit': isEdit
    };
  }

  factory AllProductDetailModel.fromMap(Map<String, dynamic> map) {
    return AllProductDetailModel(
      docId: map['docId'] ?? '',
      barcodeNumber: map['barcodeNumber'] ?? '',
      productname: map['productname'] ?? '',
      categoryID: map['categoryID'] ?? '',
      categoryName: map['categoryName'] ?? '',
      subcategoryID: map['subcategoryID'] ?? '',
      subcategoryName: map['subcategoryName'] ?? '',
      inPrice: map['inPrice'] ?? 0,
      outPrice: map['outPrice'] ?? 0,
      quantityinStock: map['quantityinStock'] ?? 0,
      expiryDate: map['expiryDate'] ?? '',
      addedDate: map['addedDate'] ?? '',
      authuid: map['authuid'] ?? '',
      unitcategoryID: map['unitcategoryID'] ?? '',
      unitcategoryName: map['unitcategoryName'] ?? '',
      packageType: map['packageType'] ?? '',
      packageTypeID: map['packageTypeID'] ?? '',
      companyName: map['companyName'] ?? '',
      companyNameID: map['companyNameID'] ?? '',
      returnType: map['returnType'] ?? '',
      itemcode: map['itemcode'] ?? '',
      outofstock: map['outofstock'] ?? false,
      isavailable: map['isavailable'] ?? true,
      isEdit: map['isedit'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllProductDetailModel.fromJson(String source) =>
      AllProductDetailModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AllProductDetailModel(docId: $docId, barcodeNumber: $barcodeNumber, productname: $productname, categoryID: $categoryID, categoryName: $categoryName, subcategoryID: $subcategoryID, subcategoryName: $subcategoryName, inPrice: $inPrice, outPrice: $outPrice, quantityinStock: $quantityinStock, expiryDate: $expiryDate, addedDate: $addedDate, authuid: $authuid, unitcategoryID: $unitcategoryID, unitcategoryName: $unitcategoryName, packageType: $packageType,packageTypeID: $packageTypeID, companyName: $companyName,companyNameID: $companyNameID, returnType: $returnType, itemcode: $itemcode, outofstock: $outofstock, isavailable: $isavailable,isedit:$isEdit)';
  }

  @override
  bool operator ==(covariant AllProductDetailModel other) {
    if (identical(this, other)) return true;

    return other.docId == docId &&
        other.barcodeNumber == barcodeNumber &&
        other.productname == productname &&
        other.categoryID == categoryID &&
        other.categoryName == categoryName &&
        other.subcategoryID == subcategoryID &&
        other.subcategoryName == subcategoryName &&
        other.inPrice == inPrice &&
        other.outPrice == outPrice &&
        other.quantityinStock == quantityinStock &&
        other.expiryDate == expiryDate &&
        other.addedDate == addedDate &&
        other.authuid == authuid &&
        other.unitcategoryID == unitcategoryID &&
        other.unitcategoryName == unitcategoryName &&
        other.packageType == packageType &&
        other.packageTypeID == packageTypeID &&
        other.companyName == companyName &&
        other.companyNameID == companyNameID &&
        other.returnType == returnType &&
        other.itemcode == itemcode &&
        other.outofstock == outofstock &&
        other.isavailable == isavailable &&
        other.isEdit == isEdit;
  }

  @override
  int get hashCode {
    return docId.hashCode ^
        barcodeNumber.hashCode ^
        productname.hashCode ^
        categoryID.hashCode ^
        categoryName.hashCode ^
        subcategoryID.hashCode ^
        subcategoryName.hashCode ^
        inPrice.hashCode ^
        outPrice.hashCode ^
        quantityinStock.hashCode ^
        expiryDate.hashCode ^
        addedDate.hashCode ^
        authuid.hashCode ^
        unitcategoryID.hashCode ^
        unitcategoryName.hashCode ^
        packageType.hashCode ^
        packageTypeID.hashCode ^
        companyName.hashCode ^
        companyNameID.hashCode ^
        returnType.hashCode ^
        itemcode.hashCode ^
        outofstock.hashCode ^
        isavailable.hashCode ^
        isEdit.hashCode;
  }
}
