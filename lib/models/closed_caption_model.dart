class ClosedCaptionModel {
  final String text;
  final String start;
  final String duration;

  ClosedCaptionModel(this.text, this.start, this.duration);

  factory ClosedCaptionModel.fromJSON(Map<String, dynamic> data) {
    return ClosedCaptionModel(data['\$'], data['@start'], data['@dur']);
  }
}
