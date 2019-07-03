class FLModel {
  final String url;
  final String desc;
  final String createdAt;

  const FLModel({this.url, this.desc, this.createdAt});

  FLModel.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        createdAt = json['createdAt'],
        desc = json['desc'];

  toJson() => {'url': url, 'desc': desc, 'publishedAt': createdAt};
}
