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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url1'] = url1;
    data['url2'] = url2;
    data['url3'] = url3;
    data['google_url'] = googleUrl;
    data['spotify_url'] = spotifyUrl;
    data['youtube_url'] = youtubeUrl;
    data['linkedin_url'] = linkedinUrl;
    data['wechat_handle'] = wechatHandle;
    data['patreon_handle'] = patreonHandle;
    data['twitter_handle'] = twitterHandle;
    data['facebook_handle'] = facebookHandle;
    data['amazon_music_url'] = amazonMusicUrl;
    data['instagram_handle'] = instagramHandle;
    return data;
  }
}