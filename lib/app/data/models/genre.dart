import 'package:podcast_ba/app/data/models/podcast.dart';

class Genre {
  String? id;
  String? name;
  int? total;
  bool? hasNext;
  List<Podcast>? podcasts;
  int? parentId;
  int? pageNumber;
  bool? hasPrevious;
  String? listennotesUrl;
  int? nextPageNumber;
  int? previousPageNumber;

  Genre(
      {this.id,
      this.name,
      this.total,
      this.hasNext,
      this.podcasts,
      this.parentId,
      this.pageNumber,
      this.hasPrevious,
      this.listennotesUrl,
      this.nextPageNumber,
      this.previousPageNumber});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    total = json['total'];
    hasNext = json['has_next'];
    if (json['podcasts'] != null) {
      podcasts = <Podcast>[];
      json['podcasts'].forEach((v) {
        podcasts!.add(Podcast.fromJson(v));
      });
    }
    parentId = json['parent_id'];
    pageNumber = json['page_number'];
    hasPrevious = json['has_previous'];
    listennotesUrl = json['listennotes_url'];
    nextPageNumber = json['next_page_number'];
    previousPageNumber = json['previous_page_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['total'] = total;
    data['has_next'] = hasNext;
    if (podcasts != null) {
      data['podcasts'] = podcasts!.map((v) => v.toJson()).toList();
    }
    data['parent_id'] = parentId;
    data['page_number'] = pageNumber;
    data['has_previous'] = hasPrevious;
    data['listennotes_url'] = listennotesUrl;
    data['next_page_number'] = nextPageNumber;
    data['previous_page_number'] = previousPageNumber;
    return data;
  }
}
