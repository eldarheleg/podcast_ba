import 'package:podcast_ba/app/data/models/podcast.dart';

class Genre {
  int? id;
  String? name;
  int? parentId;

  Genre({this.id, this.name, this.parentId});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['parent_id'] = parentId;
    return data;
  }
}
