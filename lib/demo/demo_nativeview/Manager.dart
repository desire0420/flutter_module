class Manager {
  // 工厂模式 一个工厂构造函数中返回一个 Manager 中的实例
  factory Manager() {
    return _getInstance();
  }

  static Manager get instance => _getInstance();


  static Manager _instance;

  Manager._internal() ;//无参数命名构造函数，一般用于初始化数据

  static Manager _getInstance() {
    if (_instance == null) {
      print("---null--");
      _instance = new Manager._internal();
    }
    print("---nonull--");

    return _instance;
  }
}