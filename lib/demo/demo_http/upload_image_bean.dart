class UploadImageBean {

  String imgUrl;
  int width;
  int height;
  UploadImageBean({ this.imgUrl, this.width, this.height});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['width'] = this.width;
    data['height'] =this.height;
    return data;
  }
}
