class LookingFor {
  bool? guests;
  bool? cohosts;
  bool? sponsors;
  bool? crossPromotion;

  LookingFor({this.guests, this.cohosts, this.sponsors, this.crossPromotion});

  LookingFor.fromJson(Map<String, dynamic> json) {
    guests = json['guests'];
    cohosts = json['cohosts'];
    sponsors = json['sponsors'];
    crossPromotion = json['cross_promotion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guests'] = guests;
    data['cohosts'] = cohosts;
    data['sponsors'] = sponsors;
    data['cross_promotion'] = crossPromotion;
    return data;
  }
}