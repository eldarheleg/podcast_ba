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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guests'] = this.guests;
    data['cohosts'] = this.cohosts;
    data['sponsors'] = this.sponsors;
    data['cross_promotion'] = this.crossPromotion;
    return data;
  }
}