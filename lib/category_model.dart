import 'package:flutter/material.dart';

class CategoryModel {
  String imageUrl, name, price, type, fullName, description;
  Map<String, List<String>> differentImageUrl;

  CategoryModel(
      {@required this.imageUrl,
      @required this.name,
      @required this.fullName,
      @required this.price,
      @required this.type,
      @required this.description,
      @required this.differentImageUrl});
}

List<CategoryModel> categoriesGrid = [
  CategoryModel(
      name: "Nashville",
      fullName: "Nashville armchair",
      imageUrl: 'chair_1.png',
      type: 'chair',
      price: '\$165.00',
      description: "A contemporary twist on classic mid-century modern design.",
      differentImageUrl: {
        "chair_1": ["chair_1.png", "chair_1_1.png", "chair_1_2.png"],
        "chair_0": ["chair_0.png", "chair_0_1.png", "chair_0_2.png"],
        "chair_2": [
          "chair_2.png",
          "chair_2_1.png",
          "chair_2_2.png",
          "chair_2_3.png",
          "chair_2_4.png"
        ]
      }),
  CategoryModel(
      name: "Tripod Lamp",
      fullName: "Tripod Lamp",
      imageUrl: 'tripod_lamp_1.png',
      type: 'tripod_lamp',
      price: '\$1520.00',
      description: "A contemporary twist on classic mid-century modern design.",
      differentImageUrl: {
        "tripod_lamp_1": ["tripod_lamp_1.png"],
        "tripod_lamp_2": ["tripod_lamp_2.png"],
        "tripod_lamp_3": ["tripod_lamp_3.png"]
      }),
  CategoryModel(
      name: "Floor Lamp",
      fullName: "Floor Lamp",
      imageUrl: 'floor_lamp_1.png',
      type: 'floor_lamp',
      price: '\$5520.00',
      description: "A contemporary twist on classic mid-century modern design.",
      differentImageUrl: {
        "floor_lamp_1": ["floor_lamp_1.png"],
        "floor_lamp_2": ["floor_lamp_2.png"],
        "floor_lamp_3": ["floor_lamp_3.png"]
      }),
  CategoryModel(
      name: "Sofa",
      fullName: "Sofa Set",
      imageUrl: 'sofa_1.png',
      type: 'sofa',
      price: '\$125.00',
      description: "A contemporary twist on classic mid-century modern design.",
      differentImageUrl: {
        "sofa_1": ["sofa_1.png"],
        "sofa_2": ["sofa_2.png"],
        "sofa_3": ["sofa_3.png"],
        "sofa_4": ["sofa_4.png"]
      })
];
