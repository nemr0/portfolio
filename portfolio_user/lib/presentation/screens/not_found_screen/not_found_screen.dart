import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:portfolio/presentation/helpers/globals/global_elements.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/pattern_background.dart';
import 'package:portfolio_shared/extensions/context_extension.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key,  this.buttonText = 'Home', this.onTap});
  final String buttonText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return PatternBackground(child: SafeArea(
      child: Padding(

        padding: gPadding(context.screenUtilSize).copyWith(top: 30.spMax),
        child: Container(

          padding: EdgeInsets.symmetric(vertical: 20.spMax,horizontal: 20.spMax),
          decoration: shadowDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(10),),color: AppColors.scaffoldBackground),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(
                  child: SvgPicture.asset(AppAssets.ASSETS_SVG_404_SVG)),
              Align(
                alignment: context.mobile?Alignment.centerLeft:Alignment.center,

                child: RichText(
                    textAlign: context.mobile?TextAlign.start:TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(color: AppColors.textColor,),
                  children: [
                    TextSpan(text: '404\n',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 65,),),
                    TextSpan(text: 'Not Found\n',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 32,),),
                    TextSpan(text: 'Go Back To ',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20,height: 2),),
                    TextSpan(text: buttonText,style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.primary,fontSize: 20,),
                      recognizer: TapGestureRecognizer()..onTap = onTap??(){
                      context.go('');
                      },

                    ),

                  ]
                )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
