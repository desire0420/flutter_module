import 'package:flutter/material.dart';

class DecorationStyle {

  //Flutter 中 View（典型表现是 Container Widget）中心点（0,0）实际上是真正的中心位置，而不是平常理解的 topLeft 这个点
  //Alignment(-1, 0) 表示左边中间，Alignment(1.0, 0) 表示右边中间
  //渐变背景 -默认水平反向渐变   垂直反向渐变更换参数   begin:Alignment(0.0, -1.0), end:  Alignment(0.0, 1.0),


  static BoxDecoration shapeBorderBg(
          {Color color,
          double border,
          Color borderColor,
          double borderRadius,
          List<Color> gradientColors,
          Alignment begin,
          Alignment end}) =>
      new BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xFFFA595F),
                offset: new Offset(0, 0),
                blurRadius: 12.0,
                spreadRadius: 1.0),
          ],
          gradient: LinearGradient(
            colors: gradientColors ?? [Color(0xFFFFEFEF), Color(0xFF7F57DB)],
            begin: begin ?? Alignment.centerRight,
            end: end ?? Alignment.bottomRight,
          ),
          //背景颜色
          color: color ?? Color(0xFF7F57DB),
          //边框及其颜色
          border: Border.all(width: border ?? 1.0, color: borderColor ?? Color(0xFFFA595F)),
          //圆角
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)));



//输入框装饰
  static InputDecoration inputDecoration(
          {Color bgColor,
          String hintText,
          TextStyle hintTestStyle,
          double borderRadius,
          EdgeInsetsGeometry contentPadding}) =>
      new InputDecoration(
          //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
          contentPadding: contentPadding ?? const EdgeInsets.all(0),
          hintText: hintText ?? "请输入内容",
          filled: true,
          //输入框的下滑线以及加圆角
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5), borderSide: BorderSide.none),
          //输入框背景色
          fillColor: bgColor ?? Color(0xFFf8f8f8),
          //提示字体颜色
          hintStyle: hintTestStyle ?? TextStyle(fontSize: 14, color: Color(0xFFB8BCCC)));

  //搜索输入框背景
  static InputDecoration searchInputDecoration(String hintText) => InputDecoration(
      prefixIcon: Icon(
        Icons.search,
        color: Color(0xFFB8BCCC),
      ),
      hintText: hintText ?? "请输入内容",
      contentPadding: const EdgeInsets.all(15),
      //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
      filled: true,
      //输入框的下滑线以及加圆角
      border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      //输入框背景色
      fillColor: Color(0xFFf8f8f8),
      //提示字体颜色
      hintStyle: TextStyle(fontSize: 14, color: Color(0xFFB8BCCC)));

  /*-----------------------新规范end--------------------------------*/

  //白色背景 圆角
  static ShapeDecoration whiteBg = ShapeDecoration(
    color: Color(0xffffffff),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
  );
}
