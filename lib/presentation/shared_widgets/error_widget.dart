import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/generated/assets.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';
import 'package:portfolio/data/models/exceptions/exception_abs.dart';
import 'package:portfolio/data/models/exceptions/server_error.dart';

class ItemErrorWidget extends StatelessWidget {
  const ItemErrorWidget(
      {super.key, required this.exception, required this.onRetryPressed,  this.small=false, this.retryWidget, required this.width});

  factory ItemErrorWidget.fromText(
      {required String message,
        required Future<void> Function() onRetryPressed,
        bool small = true,
        Widget? retryWidget,
        required double width,
      String? endpoint}) {
    return ItemErrorWidget(
      exception: ServerException(
          endpoint: endpoint ?? 'unknown', stackTrace: null, message: message),
      onRetryPressed: onRetryPressed,
      small: small,
      retryWidget: retryWidget,
      width: width,
    );
  }
  final Widget? retryWidget;
  final ExceptionImpl exception;
  final Future<void> Function() onRetryPressed;
  final bool small;
  final double width;
  @override
  Widget build(BuildContext context) {
   return Material(
    color: Colors.transparent,
     child: Builder(builder: (context){
       if(retryWidget !=null) return retryWidget!;
       return SizedBox(
         height: small?100:null,
         width: width,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(
               height: 12,
             ),
             Expanded(
                 flex: 4,
                 child: SvgPicture.asset(
                   Assets.svgError,

                 )),
             Padding(
               padding: small? EdgeInsets.zero:EdgeInsets.symmetric(
                   vertical: 12, horizontal: context.width * .1),
               child: Text(exception.message ?? 'Something Went Wrong',style: TextStyle(fontSize: 16.sp),),
             ),
               ShadowButton.text(
                 text: 'RETRY',
                 onPressed: onRetryPressed,
                 padding: EdgeInsets.only(bottom: 12),
               ),
           ],
         ),
       );
     }),
   );
  }
}
