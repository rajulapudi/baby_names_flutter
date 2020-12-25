class ArticleModel {
  int views;
  int wordCount;
  String heroImg;
  String title;
  String articleDescription;
  String titleUrl;

  String categoryName;

  ArticleModel(
      {this.articleDescription,
      this.categoryName,
      this.heroImg,
      this.title,
      this.titleUrl,
      this.views,
      this.wordCount});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        views: json["views"],
        wordCount: json["wordCount"],
        heroImg: json["heroImg"],
        title: json["title"],
        articleDescription: json["articleDescription"],
        titleUrl: json["titleUrl"],
        categoryName: json["categoryName"],
      );
}
