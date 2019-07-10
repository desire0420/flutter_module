class DailyModel {
  String date;
  List<News> news;

  DailyModel(this.date, this.news);

  factory DailyModel.fromJson(Map<String, dynamic> json) {
    var topList = json['top_stories'] as List;
    var newsList = json['news'] as List;
    List<News> rtNewsList = topList.map((i) => News.fromJson(i)).toList();
    for(News news in newsList.map((i) => News.fromJson(i)).toList()) {
      if(!rtNewsList.contains(news)){
        rtNewsList.add(news);
      }
    }
    return DailyModel(json['date'], rtNewsList);
  }
}

class News {
  int id;
  String title;
  String image;
  String shareUrl;

  News(this.id, this.title, this.image, this.shareUrl);

  News.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        image = json['image'],
        shareUrl = json['share_url'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is News &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

}
