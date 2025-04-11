import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/get_input_decoration.dart';

class CustomPhoneNumberTextField extends StatelessWidget{
  const CustomPhoneNumberTextField({super.key, required this.controller,  this.borderRadius=const BorderRadius.all(Radius.circular(10)),
});
  final PhoneController controller;
  final BorderRadius borderRadius;
  CountrySelectorNavigator getCountrySelector(BuildContext context){
    return CountrySelectorNavigator.bottomSheet(searchBoxTextStyle: context.textTheme.labelMedium,
      titleStyle: context.textTheme.displayMedium,
      subtitleStyle: context.textTheme.displaySmall,
      searchAutofocus: true,
      // height: context.height*.8,
      noResultMessage: 'No result found',
      searchBoxDecoration: getInputDecoration(context,borderRadius: borderRadius,hintText: 'Search'),);

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.mobile ? 0 : context.width * .3),
      child:PhoneFormField(
        controller: controller,
        style:context.textTheme.labelMedium,
        validator: PhoneValidator.compose([ PhoneValidator.validMobile(context)]),
        countrySelectorNavigator:  getCountrySelector(context),
        enabled: true,
        isCountrySelectionEnabled: true,
        isCountryButtonPersistent: true,
        enableSuggestions: false,
        countryButtonStyle:  CountryButtonStyle(
            showDialCode: true,
            showIsoCode: true,
            showFlag: true,
            flagSize: 14,
          textStyle:context.textTheme.labelMedium,
        ),
        autofillHints: [AutofillHints.telephoneNumber],
        decoration: getInputDecoration(context,borderRadius: borderRadius, hintText: 'Phone')


      ),);

  }
}