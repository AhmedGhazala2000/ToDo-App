import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/Core/function/get_responsive_font_size.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';

import '../../manager/auth_cubit/auth_cubit.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.read<AuthCubit>().selectedCountry!,
            style: AppStyles.styleBold14(context).copyWith(color: kFourthColor),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              FontAwesomeIcons.angleDown,
              color: kFourthColor,
              size: getResponsiveFontSize(context, fontSize: 22),
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
                    context.read<AuthCubit>().selectedCountry =
                        '+${country.phoneCode}';
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
