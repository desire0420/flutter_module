import 'package:flutter_module/mvp/mode/fl_model.dart';
import 'package:flutter_module/mvp/mvp.dart';

abstract class FLPresenter implements IPresenter {
  loadFLData(int pageNum, int pageSize);
}

abstract class FLView implements IView<FLPresenter> {
  void onloadFLSucces(List<FLModel> list);

  void onloadFLFail();
}
