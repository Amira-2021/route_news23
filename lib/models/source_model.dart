class SourcesModel {
  String sourceName;

  SourcesModel({required this.sourceName});

  factory SourcesModel.fromJson(json) {
    return SourcesModel(sourceName: json["name"]);
  }
}
