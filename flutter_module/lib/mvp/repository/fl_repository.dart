import 'dart:async';

import 'package:flutter_module/mvp/mode/ai_model.dart';
import 'package:flutter_module/mvp/mode/fl_model.dart';

abstract class FLRepository {
  Future<List<FLModel>> fetch(int pageNum, int pageSize);
}

abstract class AIRepository {
  Future<List<AIModel>> fetch(String type, int pageNum, int pageSize);
}
