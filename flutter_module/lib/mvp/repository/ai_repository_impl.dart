import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_module/common/constant.dart';
import 'package:flutter_module/mvp/mode/ai_model.dart';
import 'package:flutter_module/mvp/repository/fl_repository.dart';

class AIRepositoryImpl implements AIRepository {
  @override
  Future<List<AIModel>> fetch(String type, int pageNum, int pageSize) {
    return _getData(type, pageNum, pageSize);
  }
}

Future<List<AIModel>> _getData(String type, int pageNum, int pageSize) async {
  var httpClient = new HttpClient();
  var url = Constant.baseUrl + '$type/$pageSize/$pageNum';

  print(url);

  List aiModels;

  try {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var json = await response.transform(Utf8Decoder()).join();
      aiModels = jsonDecode(json)['results'];
    } else {
      //todo
    }
  } catch (exception) {
    //todo
  }

  return aiModels.map((model) {
    return new AIModel.fromJson(model);
  }).toList();
}
