class NewsClass {
  String news;
  String link;
  String pubDate;

  NewsClass({this.news, this.link, this.pubDate});

  NewsClass.fromJson(Map<String, dynamic> json) {
    news = json['news'];
    link = json['link'];
    pubDate = json['pubDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news'] = this.news;
    data['link'] = this.link;
    data['pubDate'] = this.pubDate;
    return data;
  }
}
