import 'dart:convert';

TileList tileListFromJson(String str) => TileList.fromJson(json.decode(str));

class TileList {
  TileList({required this.tileList});

  List<TileModel> tileList;

  factory TileList.fromJson(Map<String, dynamic> json) => TileList(
      tileList: List<TileModel>.from(
          json["tile_list"].map((x) => TileModel.fromJson(x))).toList());
}

class TileModel {
  TileModel(
      {required this.title, required this.subtitle, this.showTrailing = true});

  String title;
  String subtitle;
  bool showTrailing;

  factory TileModel.fromJson(Map<String, dynamic> json,
          {bool showTrailing = true}) =>
      TileModel(
          title: json["title"],
          subtitle: json["subtitle"],
          showTrailing: showTrailing);
}
