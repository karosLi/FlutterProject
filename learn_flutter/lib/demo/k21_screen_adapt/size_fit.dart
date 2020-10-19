import 'dart:ui';

class SizeFit {
  static double physicalWidth;
  static double physicalHeight;
  static double dpr;
  static double screenWidth;
  static double screenHeight;
  static double statusBarHeight;
  static double _rpx;
  static double _px;

  static void init() {
    // 物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // dpr
    dpr = window.devicePixelRatio;

    // 逻辑分辨率
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 状态栏高度
    statusBarHeight = window.padding.top / dpr;

    /// rpx，小程序
    ///   - px 是逻辑像素（在iOS中对应的是pt），把 px 逻辑像素划分为 750 份，其中一份就是 1rpx
    ///   - rpx 是相对物理像素单位，并不一定等于实际物理像素，在 iPhone6下，1rpx = 1物理像素
    ///   - 设备总宽度 750rpx
    /// iPhone6: 1rpx = 375px/750 = 0.5px = 0.5 * 2(dpr) = 1物理像素
    /// iPhone5: 1rpx = 320px/750 = 0.42px
    /// iPhone6 plus: 1rpx = 414px/750 = 0.552px
    ///

    /// 以 iPhone6 为设计标准，计算 rpx 和 px
    _rpx = screenWidth / 750;
    _px = _rpx * 2;
  }

  /// 设置物理像素
  static double rpx(double size) {
    return size * _rpx;
  }

  /// 设置逻辑像素
  static double px(double size) {
    return size * _px;
  }
}

extension IntKKSizeFit on int {
  double get rpx {
    // flutter 没有隐式转换
    return SizeFit.rpx(this.toDouble());
  }

  double get px {
    return SizeFit.px(this.toDouble());
  }
}

extension DoubleKKSizeFit on double {
  double get rpx {
    return SizeFit.rpx(this);
  }

  double get px {
    return SizeFit.px(this);
  }
}