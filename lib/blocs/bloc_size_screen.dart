import 'dart:ui';

import '../data_types.dart';

import '../entities.dart';

class BlocSize extends Bloc {
  static const Size _kSizeDefault = Size(320, 320);

  BlocSize() {
    addStreamController<String, Size>('size', _kSizeDefault);
  }



  Size get size => getValue('size') as Size;

  set size(Size sizeTmp) {
    setValue('size', sizeTmp);
  }

  Stream<Size> get sizeStream => getStream("size") as Stream<Size>;

  ScreenType screenType(double width) {
    return (width > 600) ? ScreenType.desktop : ScreenType.mobile;
  }


}
