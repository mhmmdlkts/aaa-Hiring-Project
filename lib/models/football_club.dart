class FootballClub {
  late String name;
  late String country;
  late int value;
  late String imageUrl;
  late int europeanTitles;

  FootballClub.fromJson(Map json) {
    name = json["name"];
    country = json["country"];
    value = json["value"];
    imageUrl = json["image"];
    europeanTitles = json["european_titles"];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'country': country,
    'value': value,
    'image': imageUrl,
    'european_titles': europeanTitles
  };

}