import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';
import 'package:portfolio/presentation/state_manager/add_contact/add_contact_cubit.dart' show AddContactCubit;

class ContactSuccessWidget extends StatelessWidget {
  const ContactSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10.sp,
      children: [
        Icon(
          Ionicons.checkmark_done_circle,
          size: 40.sp,
          color: AppColors.textColor,
        ),
        Text(
          "Your message has been sent",
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
          ),
        ),
        ShadowButton.text(
          text: "Send Again?",
          onPressed: () async {
            AddContactCubit.get(context).sendAgain();
          },
        ),
      ],
    );
  }
}