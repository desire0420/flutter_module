import 'dart:ui';

//原始FPS回调  FPS=60* 实际渲染的帧数 / 本来应该在这个时间内渲染完成的帧数。
var orginalCallback;

//仅缓存最近25帧绘制耗时
const maxframes = 25;

final lastFrames = List<FrameTiming>();
//基准VSync信号周期
const frameInterval = const Duration(microseconds: Duration.microsecondsPerSecond ~/ 60);

void onReportTimings(List<FrameTiming> timings) {
  lastFrames.addAll(timings);
  //仅保留25帧
  if (lastFrames.length > maxframes) {
    lastFrames.removeRange(0, lastFrames.length - maxframes);
  }
  //如果有原始帧回调函数，则执行
  if (orginalCallback != null) {
    orginalCallback(timings);
  }
  print("fps : $fps");
}

double get fps {
  int sum = 0;
  for (FrameTiming timing in lastFrames) {
    //计算渲染耗时
    int duration = timing.timestampInMicroseconds(FramePhase.rasterFinish) -
        timing.timestampInMicroseconds(FramePhase.buildStart);
    //判断耗时是否在Vsync信号周期内
    // print("frameInterval : ${frameInterval.inMicroseconds}");
    if (duration < frameInterval.inMicroseconds) {
      sum += 1;
    } else {
      //有丢帧，向上取整
      int count = (duration / frameInterval.inMicroseconds).ceil();
      sum += count;
    }
  }
  return lastFrames.length / sum * 60;
}
