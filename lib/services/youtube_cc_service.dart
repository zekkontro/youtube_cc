import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_cc/models/closed_caption_model.dart';

class ClosedCaptionsService {
  Xml2Json _xml2json = Xml2Json();

  String _convertJSON(String xmlData) {
    _xml2json.parse(xmlData);
    return _xml2json.toBadgerfish();
  }

  Future<List<ClosedCaptionModel>> getAllClosedCaptions(
      {@required String videoID, @required String language}) async {
    String baseURL =
        "https://video.google.com/timedtext?lang=$language&v=$videoID";

    http.Response res = await http.get(baseURL);
    String jsonData = _convertJSON(res.body);
    print(jsonData);
    Map<String, dynamic> mapData = jsonDecode(jsonData);
    List<dynamic> data = mapData['transcript']['text'];
    List<ClosedCaptionModel> model = List<ClosedCaptionModel>.generate(
        data.length, (index) => ClosedCaptionModel.fromJSON(data[index]));
    return model;
  }

  Future<ClosedCaptionModel> getClosedCaptionByTime(
      {@required String videoID,
      @required String language,
      @required int second}) async {
    String baseURL =
        "https://video.google.com/timedtext?lang=$language&v=$videoID";

    http.Response res = await http.get(baseURL);
    String jsonData = _convertJSON(res.body);

    Map<String, dynamic> mapData = jsonDecode(jsonData);

    List<dynamic> data = mapData['transcript']['text'];

    ClosedCaptionModel model =
        ClosedCaptionModel.fromJSON(data.where((element) {
      ClosedCaptionModel model = ClosedCaptionModel.fromJSON(element);
      double start = double.parse(model.start);
      print(start);

      int intData = start.round();

      return intData == second;
    }).first);

    return model;
  }
}
