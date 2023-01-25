class Episodes {
  String? id;
  String? link;
  String? audio;
  String? image;
  String? title;
  String? thumbnail;
  String? description;
  int? pubDateMs;
  String? guidFromRss;
  String? listennotesUrl;
  int? audioLengthSec;
  bool? explicitContent;
  bool? maybeAudioInvalid;
  String? listennotesEditUrl;

  Episodes(
      {this.id,
      this.link,
      this.audio,
      this.image,
      this.title,
      this.thumbnail,
      this.description,
      this.pubDateMs,
      this.guidFromRss,
      this.listennotesUrl,
      this.audioLengthSec,
      this.explicitContent,
      this.maybeAudioInvalid,
      this.listennotesEditUrl});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    audio = json['audio'];
    image = json['image'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    pubDateMs = json['pub_date_ms'];
    guidFromRss = json['guid_from_rss'];
    listennotesUrl = json['listennotes_url'];
    audioLengthSec = json['audio_length_sec'];
    explicitContent = json['explicit_content'];
    maybeAudioInvalid = json['maybe_audio_invalid'];
    listennotesEditUrl = json['listennotes_edit_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['audio'] = this.audio;
    data['image'] = this.image;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['description'] = this.description;
    data['pub_date_ms'] = this.pubDateMs;
    data['guid_from_rss'] = this.guidFromRss;
    data['listennotes_url'] = this.listennotesUrl;
    data['audio_length_sec'] = this.audioLengthSec;
    data['explicit_content'] = this.explicitContent;
    data['maybe_audio_invalid'] = this.maybeAudioInvalid;
    data['listennotes_edit_url'] = this.listennotesEditUrl;
    return data;
  }
}