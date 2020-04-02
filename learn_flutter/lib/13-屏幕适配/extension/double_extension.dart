import '../size_fit.dart';

extension DoubleFit on double {
  double get px {
    return FHSizeFit.setPx(this);
  }

  double get rpx {
    return FHSizeFit.setRpx(this);
  }
}