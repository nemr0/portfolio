import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:portfolio/core/const/animation_durations.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/di_middleware.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/data/models/contact/contact.dart';
import 'package:portfolio/domain/services/country_service.dart';
import 'package:portfolio/presentation/helpers/validators/validate_email.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/contact_me/custom_text_field.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/contact_me/phone_number_text_field.dart';
import 'package:portfolio/presentation/shared_widgets/item_animation_builder.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';
import 'package:portfolio/presentation/state_manager/add_contact/add_contact_cubit.dart';

class ContactMeBody extends StatefulWidget {
  const ContactMeBody({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final ScrollController controller;
  final FocusNode focusNode;

  @override
  State<ContactMeBody> createState() => _ContactMeBodyState();
}

class _ContactMeBodyState extends State<ContactMeBody> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final PhoneController  phoneController;
  late final TextEditingController descriptionController;
  late final TextEditingController companyController;
  clearData(){
    nameController.clear();
    emailController.clear();
    phoneController.changeNationalNumber('');
    descriptionController.clear();
    companyController.clear();
  }
  late bool success;
  showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Ionicons.bug,
              size: 16,
              color: AppColors.textColor,
            ),
            SizedBox(width: 8.sp),
            Expanded(
              child: Text(
                'An error occurred, please try again later!',
                style: TextStyle(color: AppColors.textColor,fontSize: 14),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        padding: EdgeInsets.all(8.sp),
        margin: EdgeInsets.all(12.sp).copyWith(right: context.mobile ? 12.sp : context.width * .3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      dismissDirection: DismissDirection.down,

      ),

    );
  }

  @override
  void initState() {
    super.initState();
    TextInput.finishAutofillContext();
    success = false;
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = PhoneController(initialValue: PhoneNumber.fromJson(DIMiddleware.get<CountryService>().countryDetails.toJson()));
    DIMiddleware.get<CountryService>().getCountryCode().then((value){
      phoneController.changeCountry(IsoCode.fromJson(value.countryIsoCode));
    });
    descriptionController = TextEditingController();
    companyController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      CustomTextField(
        hint: 'Full Name *',
        controller: nameController,
        validator: validateName,
        keyboardType: TextInputType.name,
        focusNode: widget.focusNode,
        autoFillHints: [AutofillHints.name],
      ),
      CustomTextField(
        hint: 'Company',
        controller: companyController,
        keyboardType: TextInputType.text,
      ),
      CustomTextField(
        hint: 'Email *',
        controller: emailController,
        validator: validateEmail,
        keyboardType: TextInputType.emailAddress,
        autoFillHints: [AutofillHints.email],
      ),
      CustomPhoneNumberTextField(
        controller: phoneController, 
      ),
      CustomTextField(
        hint: 'Description *',
        controller: descriptionController,
        validator: validateDescription,
        minLines: 4,
        maxLines: 8,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
      ),
      Builder(
        builder: (ctx) {
          return SubmitButton(
            onPressed: () async {
              if (Form.of(ctx).validate() == true) {
                AddContactCubit.get(ctx).addContact(
                  Contact(
                    name: nameController.text,
                    email: emailController.text,
                    desc: descriptionController.text,
                    company: companyController.text,
                    phoneNumber: phoneController.value.international.replaceFirst('+', ''),
                  ),
                );
              }
            },
          );
        },
      ),
    ];

    return BlocConsumer<AddContactCubit, AddContactState>(
      listener: (context, state) {
        if(state is AddContactInitial){
          if(state.focus == true){
            TextInput.finishAutofillContext();
            widget.focusNode.requestFocus();
          }
        }
        if (state is AddContactSuccess) {
         clearData();
        }
        if (state is AddContactFailed) {
          showErrorSnackBar(context);
        }
      },
      listenWhen: (_, state) => state is AddContactSuccess || state is AddContactFailed || state is AddContactInitial ,
      buildWhen: (_, state) => state is AddContactSaved || state is AddContactInitial || state is AddContactSuccess,
      builder: (context, state) {
        if (state is AddContactSaved || state is AddContactSuccess) {
          return LiveSliverList(

            itemBuilder: (_,__,animation) => ItemAnimationBuilder(
                animation: animation,
                animationType: AnimationType.upToDown,
                child: const ContactSuccessWidget()), itemCount: 1, controller: ScrollController(),
            showItemInterval: reanimateToANewWidgetInterval,
          );
        }
        return Form(
          child: AutofillGroup(
            child: LiveSliverList(
              itemBuilder: (
                BuildContext context,
                int index,
                Animation<double> animation,
              ) {

                return Padding(
                  padding: EdgeInsets.only(top: 12.spMin),
                  child: ItemAnimationBuilder(
                    animation: animation,
                    child: Align(
                      alignment:  Alignment.centerLeft,
                      child: children[index],
                    ),
                  ),
                );
              },
              itemCount: children.length,
              controller: widget.controller,
              showItemInterval: showItemDuration,
              showItemDuration: showItemInterval,
              reAnimateOnVisibility: true,
            ),
          ),
        );
      },
    );
  }
}

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
