import 'dart:convert';

List<CategoryModel> categoryModelListFromJson(String val) =>
    List<CategoryModel>.from(json
        .decode(val)['data']
        .map((category) => CategoryModel.categoryFromJson(category)));

class CategoryModel {
  final String id;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.categoryFromJson(Map<String, dynamic> data) =>
      CategoryModel(id: data['id'], name: data['name'], image: data['imgs']);
}
