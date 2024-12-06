import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:portfolio/presentation/routes/hero_page/hero_page_route.dart';

showCupertinoModalSheetWithHeroEnabled(

    { required BuildContext context, required Widget Function(BuildContext) builder,bool barrierDismissible = true,bool semanticsDismissible = false,String barrierLabel='Dismiss', ImageFilter? filter,Duration transitionDuration= const Duration(milliseconds: 200)}) =>
  Navigator.of(context).push(HeroPageRoute(
      builder: builder,
      barrierDismissible: barrierDismissible,
      semanticsDismissible:semanticsDismissible ,
      barrierLabel: barrierLabel,
      filter: filter,
      transitionDuration: transitionDuration,
  ));

