import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/Core/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String selectedCountry = '+20';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedCountry,
            style: AppStyles.styleBold14.copyWith(color: kSecondColor),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              FontAwesomeIcons.angleDown,
              color: kSecondColor,
            ),
            onPressed: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                countryListTheme: CountryListThemeData(
                  bottomSheetHeight: MediaQuery.sizeOf(context).height * 0.6,
                ),
                onSelect: (Country country) {
                  setState(() {
                    selectedCountry = '+${country.phoneCode}';
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
