import 'dart:async';

import 'package:learn_flutter/demo/k24_bloc/bloc_base.dart';

class BlocData implements BlocBase {
  int _count;

  /// 输出 stream controller，用户输出用户行为之后的数据
  StreamController<int> _outputController = StreamController();
  StreamSink<int> get _inStreamForOutput => _outputController.sink;
  Stream<int> get outStream => _outputController.stream;

  /// 输入 stream controller，用于监听用户行为
  StreamController<int> _inputController = StreamController();
  StreamSink<int> get inStream => _inputController.sink;
  Stream<int> get _outStreamForInput => _inputController.stream;

  BlocData() {
    _count = 0;

    /// 监听用户输入
    _outStreamForInput.listen((event) {
      /// 处理业务逻辑
      _count = _count + 1;

      /// 把处理后的数据，交给输出流控制器，外部 widget 可以通过监听输出流控制的 stream 来监听数据变化，从而改变 ui
      _inStreamForOutput.add(_count);
    });
  }

  @override
  void dispose() {
    /// 关闭输入和输出流控制器
    _outputController.close();
    _inputController.close();
  }
}