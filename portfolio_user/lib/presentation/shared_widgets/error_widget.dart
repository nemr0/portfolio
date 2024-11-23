import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart';
import 'package:portfolio_shared/data/models/exceptions/server_error.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, required this.exception, this.onRetryPressed,  this.small=false, this.retryWidget});

  factory CustomErrorWidget.fromText(
      {required String message,
      VoidCallback? onRetryPressed,
        bool small = true,
        Widget? retryWidget,
      String? endpoint}) {
    return CustomErrorWidget(
      exception: ServerException(
          endpoint: endpoint ?? 'unknown', stackTrace: null, message: message),
      onRetryPressed: onRetryPressed,
      small: small,
      retryWidget: retryWidget,
    );
  }
  final Widget? retryWidget;
  final ExceptionImpl exception;
  final VoidCallback? onRetryPressed;
  final bool small;
  @override
  Widget build(BuildContext context) {
    if(retryWidget !=null) return retryWidget!;
    return IntrinsicHeight(
      child: SizedBox(
        height: small?100:null,
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
              child: Text(exception.message ?? 'Something Went Wrong'),
            ),
            if (onRetryPressed != null)
              ShadowButton.text(
                text: 'RETRY',
                onPressed: onRetryPressed,
                padding: EdgeInsets.only(bottom: 12),
              ),
          ],
        ),
      ),
    );
  }
}
