// Package imports:
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import '../../constants/material_desgin/k_keys.dart';
import '../../constants/server/caching_service.dart';
import '../../utils/routes/router.dart';

CachingServices box = GetIt.instance.get<CachingServices>();
AppRouter router = GetIt.instance.get<AppRouter>();
KKeys keys = KKeys();



/// Screen size methods
double height(double newHeight) {
  double finalHeight = (newHeight * 100) / 896;
  return finalHeight.h;
}

double width(double newWidth) {
  double finalWidth = (newWidth * 100) / 414;
  return finalWidth.w;
}


