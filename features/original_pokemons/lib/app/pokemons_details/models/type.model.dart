import 'dart:convert';

class TypeModel {
  TypeModel({
    required this.name,
    required this.url,
  });

  factory TypeModel.fromJson(String str) => TypeModel.fromMap(json.decode(str));

  factory TypeModel.fromMap(Map<String, dynamic> json) => TypeModel(
        name: json['name'],
        url: json['url'],
      );

  final String name;
  final String url;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };
}
