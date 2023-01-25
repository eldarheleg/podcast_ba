import 'package:podcast_ba/app/data/models/episodes.dart';
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
  List<Episodes>? episodes;
  String? language;
  List<int>? genreIds;
  int? itunesId;
  String? publisher;
  String? thumbnail;
  bool? isClaimed;
  String? description;
  LookingFor? lookingFor;
  int? listenScore;
  int? totalEpisodes;
  String? listennotesUrl;
  int? audioLengthSec;
  bool? explicitContent;
  String? latestEpisodeId;
  int? latestPubDateMs;
  int? earliestPubDateMs;
  int? nextEpisodePubDate;
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
      this.episodes,
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
      this.nextEpisodePubDate,
      this.updateFrequencyHours,
      this.listenScoreGlobalRank});

  Podcast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rss = json['rss'];
    type = json['type'];
    email = json['email'];
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
    image = json['image'];
    title = json['title'];
    country = json['country'];
    website = json['website'];
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(new Episodes.fromJson(v));
      });
    }
    language = json['language'];
    genreIds = json['genre_ids'].cast<int>();
    itunesId = json['itunes_id'];
    publisher = json['publisher'];
    thumbnail = json['thumbnail'];
    isClaimed = json['is_claimed'];
    description = json['description'];
    lookingFor = json['looking_for'] != null
        ? new LookingFor.fromJson(json['looking_for'])
        : null;
    listenScore = json['listen_score'];
    totalEpisodes = json['total_episodes'];
    listennotesUrl = json['listennotes_url'];
    audioLengthSec = json['audio_length_sec'];
    explicitContent = json['explicit_content'];
    latestEpisodeId = json['latest_episode_id'];
    latestPubDateMs = json['latest_pub_date_ms'];
    earliestPubDateMs = json['earliest_pub_date_ms'];
    nextEpisodePubDate = json['next_episode_pub_date'];
    updateFrequencyHours = json['update_frequency_hours'];
    listenScoreGlobalRank = json['listen_score_global_rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rss'] = this.rss;
    data['type'] = this.type;
    data['email'] = this.email;
    if (this.extra != null) {
      data['extra'] = this.extra!.toJson();
    }
    data['image'] = this.image;
    data['title'] = this.title;
    data['country'] = this.country;
    data['website'] = this.website;
    if (this.episodes != null) {
      data['episodes'] = this.episodes!.map((v) => v.toJson()).toList();
    }
    data['language'] = this.language;
    data['genre_ids'] = this.genreIds;
    data['itunes_id'] = this.itunesId;
    data['publisher'] = this.publisher;
    data['thumbnail'] = this.thumbnail;
    data['is_claimed'] = this.isClaimed;
    data['description'] = this.description;
    if (this.lookingFor != null) {
      data['looking_for'] = this.lookingFor!.toJson();
    }
    data['listen_score'] = this.listenScore;
    data['total_episodes'] = this.totalEpisodes;
    data['listennotes_url'] = this.listennotesUrl;
    data['audio_length_sec'] = this.audioLengthSec;
    data['explicit_content'] = this.explicitContent;
    data['latest_episode_id'] = this.latestEpisodeId;
    data['latest_pub_date_ms'] = this.latestPubDateMs;
    data['earliest_pub_date_ms'] = this.earliestPubDateMs;
    data['next_episode_pub_date'] = this.nextEpisodePubDate;
    data['update_frequency_hours'] = this.updateFrequencyHours;
    data['listen_score_global_rank'] = this.listenScoreGlobalRank;
    return data;
  }
}






