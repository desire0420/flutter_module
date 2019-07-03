import 'package:flutter_module/mvp/fl_presenter.dart';
import 'package:flutter_module/mvp/repository/fl_repository.dart';
import 'package:flutter_module/mvp/repository/fl_repository_impl.dart';

class FLPresenterImpl implements FLPresenter {
  FLView view;

  FLRepository repository;

  FLPresenterImpl(this.view) {
    view.setPresenter(this);
  }

  @override
  void loadFLData(int pageNum, int pageSize) {
    assert(view != null);
    repository.fetch(pageNum, pageSize).then((data) {
      view.onloadFLSucces(data);
    }).catchError((error) {
      print(error);
      view.onloadFLFail();
    });
  }

  @override
  init() {
    repository = new FLRepositoryImpl();
  }
}
