import '../size_fit.dart';

extension IntFit on int {
  double get px {
    return FHSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return FHSizeFit.setRpx(this.toDouble());
  }
}