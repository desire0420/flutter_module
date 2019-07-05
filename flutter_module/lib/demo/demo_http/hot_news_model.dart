class HotNewsStoriesModel {
  final String biaoshi;
  final String artist_name;
  final String country;

  const HotNewsStoriesModel({this.biaoshi, this.artist_name, this.country});

  HotNewsStoriesModel.fromJson(Map<String, dynamic> json)
      : biaoshi = json['biaoshi'],
        artist_name = json['artist_name'],
        country = json['country'];
}
