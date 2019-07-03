import 'package:flutter_module/mvp/fl_model.dart';
import 'package:flutter_module/mvp/mvp.dart';



abstract class FLPresenter implements IPresenter{
  loadFLData(int pageNum,int pageSize);
}


abstract class FLView implements IView<FLPresenter>{
  void onloadFLSuc(List<FLModel> list);
  void onloadFLFail();
}
