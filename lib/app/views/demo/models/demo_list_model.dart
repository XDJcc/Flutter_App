class DemoListDetail {
  int? id;
  String? pages;
  String? title;
  String? time;
  String? img;
  String? content;

  DemoListDetail(
      {this.id, this.pages, this.title, this.time, this.img, this.content});

  DemoListDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pages = json['pages'];
    title = json['title'];
    time = json['time'];
    img = json['img'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pages'] = this.pages;
    data['title'] = this.title;
    data['time'] = this.time;
    data['img'] = this.img;
    data['content'] = this.content;
    return data;
  }
}
