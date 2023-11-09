import 'package:flutter/material.dart';
import 'package:radioapp/api_call.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    const ApiCall();
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
      name: 'P1',
      iconPath:
          'https://static-cdn.sr.se/images/132/2186745_512_512.jpg?preset=api-default-square',
      boxColor: const Color(0xff92A3FD),
    ));

    categories.add(CategoryModel(
      name: 'P2',
      iconPath:
          'https://static-cdn.sr.se/images/163/2186754_512_512.jpg?preset=api-default-square',
      boxColor: const Color.fromARGB(255, 253, 146, 239),
    ));

    categories.add(CategoryModel(
      name: 'P3',
      iconPath:
          'https://static-cdn.sr.se/images/164/2186756_512_512.jpg?preset=api-default-square',
      boxColor: const Color(0xff92A3FD),
    ));

    categories.add(CategoryModel(
      name: 'P4',
      iconPath:
          'https://static-cdn.sr.se/images/103/93751e41-25be-443e-aa50-3d65b67ae5ac.jpg?preset=api-default-square',
      boxColor: const Color.fromARGB(255, 199, 226, 22),
    ));

    return categories;
  }
}
