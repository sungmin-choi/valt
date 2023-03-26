import 'dart:convert';

import 'package:valt/model/product.dart';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.content,
    required this.pageable,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.number,
    required this.sort,
    required this.size,
    required this.numberOfElements,
    required this.first,
    required this.empty,
  });

  List<Product> content;
  Pageable pageable;
  int totalPages;
  int totalElements;
  bool last;
  int number;
  Sort sort;
  int size;
  int numberOfElements;
  bool first;
  bool empty;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        content:
            List<Product>.from(json["content"].map((x) => Product.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        last: json["last"],
        number: json["number"],
        sort: Sort.fromJson(json["sort"]),
        size: json["size"],
        numberOfElements: json["numberOfElements"],
        first: json["first"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "totalPages": totalPages,
        "totalElements": totalElements,
        "last": last,
        "number": number,
        "sort": sort.toJson(),
        "size": size,
        "numberOfElements": numberOfElements,
        "first": first,
        "empty": empty,
      };
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.paged,
    required this.unpaged,
  });

  Sort sort;
  int offset;
  int pageSize;
  int pageNumber;
  bool paged;
  bool unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        offset: json["offset"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        paged: json["paged"],
        unpaged: json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "offset": offset,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "paged": paged,
        "unpaged": unpaged,
      };
}

class Sort {
  Sort({
    required this.empty,
    required this.unsorted,
    required this.sorted,
  });

  bool empty;
  bool unsorted;
  bool sorted;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        empty: json["empty"],
        unsorted: json["unsorted"],
        sorted: json["sorted"],
      );

  Map<String, dynamic> toJson() => {
        "empty": empty,
        "unsorted": unsorted,
        "sorted": sorted,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
