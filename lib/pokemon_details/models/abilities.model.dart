import 'dart:convert';

class AbilitiesModel {
  factory AbilitiesModel.fromMap(Map<String, dynamic> json) => AbilitiesModel(
        name: json['name'],
        url: json['url'],
      );

  factory AbilitiesModel.fromJson(String str) =>
      AbilitiesModel.fromMap(json.decode(str));

  AbilitiesModel({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };
}
