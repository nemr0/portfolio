import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';
import 'package:portfolio/presentation/state_manager/add_contact/add_contact_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onPressed});

  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactCubit, AddContactState>(
      builder: (context, state) {
        return ShadowButton(
          padding: EdgeInsets.only(bottom: 10.h),
          color:
          state is AddContactFailed
              ? AppColors.codeBlockBG
              : AppColors.primary,
          onPressed:
          state is AddContactLoading || state is AddContactSuccess
              ? null
              : onPressed,
          child: state is AddContactLoading
              ? CupertinoActivityIndicator()
              : ShadowButton.textWidget('SUBMIT'),
        );
      },
    );
  }
}
