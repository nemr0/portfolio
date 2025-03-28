import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';
import 'package:portfolio/data/models/exceptions/exception_abs.dart';
import 'package:portfolio/data/models/exceptions/server_error.dart';

class ItemErrorWidget extends StatelessWidget {
  const ItemErrorWidget(
      {super.key, required this.exception, this.onRetryPressed,  this.small=false, this.retryWidget, required this.width});

  factory ItemErrorWidget.fromText(
      {required String message,
      VoidCallback? onRetryPressed,
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
  final VoidCallback? onRetryPressed;
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
                   AppAssets.ASSETS_SVG_ERROR_SVG,

                 )),
             Padding(
               padding: small? EdgeInsets.zero:EdgeInsets.symmetric(
                   vertical: 12, horizontal: context.width * .1),
               child: Text(exception.message ?? 'Something Went Wrong',style: TextStyle(fontSize: 16.sp),),
             ),
             if (onRetryPressed != null)
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
