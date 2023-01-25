class Extra {
  String? url1;
  String? url2;
  String? url3;
  String? googleUrl;
  String? spotifyUrl;
  String? youtubeUrl;
  String? linkedinUrl;
  String? wechatHandle;
  String? patreonHandle;
  String? twitterHandle;
  String? facebookHandle;
  String? amazonMusicUrl;
  String? instagramHandle;

  Extra(
      {this.url1,
      this.url2,
      this.url3,
      this.googleUrl,
      this.spotifyUrl,
      this.youtubeUrl,
      this.linkedinUrl,
      this.wechatHandle,
      this.patreonHandle,
      this.twitterHandle,
      this.facebookHandle,
      this.amazonMusicUrl,
      this.instagramHandle});

  Extra.fromJson(Map<String, dynamic> json) {
    url1 = json['url1'];
    url2 = json['url2'];
    url3 = json['url3'];
    googleUrl = json['google_url'];
    spotifyUrl = json['spotify_url'];
    youtubeUrl = json['youtube_url'];
    linkedinUrl = json['linkedin_url'];
    wechatHandle = json['wechat_handle'];
    patreonHandle = json['patreon_handle'];
    twitterHandle = json['twitter_handle'];
    facebookHandle = json['facebook_handle'];
    amazonMusicUrl = json['amazon_music_url'];
    instagramHandle = json['instagram_handle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url1'] = this.url1;
    data['url2'] = this.url2;
    data['url3'] = this.url3;
    data['google_url'] = this.googleUrl;
    data['spotify_url'] = this.spotifyUrl;
    data['youtube_url'] = this.youtubeUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['wechat_handle'] = this.wechatHandle;
    data['patreon_handle'] = this.patreonHandle;
    data['twitter_handle'] = this.twitterHandle;
    data['facebook_handle'] = this.facebookHandle;
    data['amazon_music_url'] = this.amazonMusicUrl;
    data['instagram_handle'] = this.instagramHandle;
    return data;
  }
}