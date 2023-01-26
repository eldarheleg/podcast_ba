import 'package:podcast_ba/app/data/models/extra.dart';
import 'package:podcast_ba/app/data/models/looking_for.dart';

class Podcast {
  String? id;
  String? rss;
  String? type;
  String? email;
  Extra? extra;
  String? image;
  String? title;
  String? country;
  String? website;
  String? language;
  List<int>? genreIds;
  int? itunesId;
  String? publisher;
  String? thumbnail;
  bool? isClaimed;
  String? description;
  LookingFor? lookingFor;
  String? listenScore;
  int? totalEpisodes;
  String? listennotesUrl;
  int? audioLengthSec;
  bool? explicitContent;
  String? latestEpisodeId;
  int? latestPubDateMs;
  int? earliestPubDateMs;
  int? updateFrequencyHours;
  String? listenScoreGlobalRank;

  Podcast(
      {this.id,
      this.rss,
      this.type,
      this.email,
      this.extra,
      this.image,
      this.title,
      this.country,
      this.website,
      this.language,
      this.genreIds,
      this.itunesId,
      this.publisher,
      this.thumbnail,
      this.isClaimed,
      this.description,
      this.lookingFor,
      this.listenScore,
      this.totalEpisodes,
      this.listennotesUrl,
      this.audioLengthSec,
      this.explicitContent,
      this.latestEpisodeId,
      this.latestPubDateMs,
      this.earliestPubDateMs,
      this.updateFrequencyHours,
      this.listenScoreGlobalRank});

  Podcast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rss = json['rss'];
    type = json['type'];
    email = json['email'];
    extra = json['extra'] != null ? Extra.fromJson(json['extra']) : null;
    image = json['image'];
    title = json['title'];
    country = json['country'];
    website = json['website'];
    language = json['language'];
    genreIds = json['genre_ids'].cast<int>();
    itunesId = json['itunes_id'];
    publisher = json['publisher'];
    thumbnail = json['thumbnail'];
    isClaimed = json['is_claimed'];
    description = json['description'];
    lookingFor = json['looking_for'] != null
        ? LookingFor.fromJson(json['looking_for'])
        : null;
    listenScore = json['listen_score'];
    totalEpisodes = json['total_episodes'];
    listennotesUrl = json['listennotes_url'];
    audioLengthSec = json['audio_length_sec'];
    explicitContent = json['explicit_content'];
    latestEpisodeId = json['latest_episode_id'];
    latestPubDateMs = json['latest_pub_date_ms'];
    earliestPubDateMs = json['earliest_pub_date_ms'];
    updateFrequencyHours = json['update_frequency_hours'];
    listenScoreGlobalRank = json['listen_score_global_rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rss'] = rss;
    data['type'] = type;
    data['email'] = email;
    if (extra != null) {
      data['extra'] = extra!.toJson();
    }
    data['image'] = image;
    data['title'] = title;
    data['country'] = country;
    data['website'] = website;
    data['language'] = language;
    data['genre_ids'] = genreIds;
    data['itunes_id'] = itunesId;
    data['publisher'] = publisher;
    data['thumbnail'] = thumbnail;
    data['is_claimed'] = isClaimed;
    data['description'] = description;
    if (lookingFor != null) {
      data['looking_for'] = lookingFor!.toJson();
    }
    data['listen_score'] = listenScore;
    data['total_episodes'] = totalEpisodes;
    data['listennotes_url'] = listennotesUrl;
    data['audio_length_sec'] = audioLengthSec;
    data['explicit_content'] = explicitContent;
    data['latest_episode_id'] = latestEpisodeId;
    data['latest_pub_date_ms'] = latestPubDateMs;
    data['earliest_pub_date_ms'] = earliestPubDateMs;
    data['update_frequency_hours'] = updateFrequencyHours;
    data['listen_score_global_rank'] = listenScoreGlobalRank;
    return data;
  }
}