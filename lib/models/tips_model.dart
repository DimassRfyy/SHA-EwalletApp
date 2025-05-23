class TipsModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnail;

  TipsModel({this.id, this.title, this.url, this.thumbnail});

  factory TipsModel.fromJson(Map<String, dynamic> data) => TipsModel(
    id: data['id'],
    title: data['title'],
    url: data['url'],
    thumbnail: data['thumbnail'],
  );
}
