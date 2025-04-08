import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/animation_durations.dart';
import 'package:portfolio/core/di_middleware.dart';
import 'package:portfolio/data/models/contact/contact.dart';
import 'package:portfolio/domain/remote_source/database/baas_database_abstract.dart';
import 'package:portfolio/presentation/helpers/validators/validate_email.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/contact_me/custom_text_field.dart';
import 'package:portfolio/presentation/shared_widgets/item_animation_builder.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';
import 'package:portfolio/presentation/state_manager/add_contact/add_contact_cubit.dart';

class ContactMeBody extends StatefulWidget {
  const ContactMeBody({
    super.key,
    required this.controller,
    required this.scrollToEnd,
    required this.focusNode,
  });

  final ScrollController controller;
  final VoidCallback scrollToEnd;
  final FocusNode focusNode;

  @override
  State<ContactMeBody> createState() => _ContactMeBodyState();
}

class _ContactMeBodyState extends State<ContactMeBody> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController descriptionController;
  late final TextEditingController companyController;

  focusListener() {
    if (widget.focusNode.hasFocus) {}
  }

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(focusListener);
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    descriptionController = TextEditingController();
    companyController = TextEditingController();
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(focusListener);
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
      CustomTextField(
        hint: 'Phone',
        controller: phoneController,
        validator: validateMobile,
        keyboardType: TextInputType.phone,
        autoFillHints: [AutofillHints.telephoneNumber],
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
        builder: (context) {
          return SubmitButton(
            scrollToEnd: widget.scrollToEnd,
            onPressed: () async {
              if (Form.of(context).validate() == true) {
                AddContactCubit.get(context).addContact(Contact(
              name: nameController.text,
              email: emailController.text,
              desc: descriptionController.text,
              company: companyController.text,
              phoneNumber: phoneController.text,
              ));
              }

              Future.delayed(Duration(milliseconds: 100), () {
                widget.scrollToEnd();
              });
            },
          );
        }
      ),
    ];

    return BlocProvider(
      create: (context) => AddContactCubit(baasService: DIMiddleware.get<BAASService>()),
      child: Form(
        child: AutofillGroup(
          child: LiveSliverList.options(
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
                    alignment: Alignment.centerLeft,
                    child: children[index],
                  ),
                ),
              );
            },
            itemCount: children.length,
            controller: widget.controller,
            options: LiveOptions(
              showItemInterval: showItemDuration,
              showItemDuration: showItemInterval,
              reAnimateOnVisibility: true,
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.scrollToEnd, required this.onPressed,
  });

  final VoidCallback scrollToEnd;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddContactCubit, AddContactState>(
      builder: (context, state) {
        return ShadowButton(
          padding: EdgeInsets.only(bottom: 10.h),
          onPressed:
              state is AddContactLoading || state is AddContactSuccess
                  ? null
                  : onPressed,
          child:
              state is AddContactLoading
                  ? CupertinoActivityIndicator()
                  : ShadowButton.textWidget('SUBMIT'),
        );
      },
    );
  }
}
