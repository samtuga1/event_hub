import 'dart:io';

import 'package:event_hub/consts/global_methods.dart';
import 'package:event_hub/logic/cubits/image_picker/image_picker_cubit.dart';
import 'package:event_hub/presentation/screens/onboarding/auth_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/interest_screen.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../widgets/textformbox.dart';

class FillInfoScreen extends StatefulWidget {
  static const routeName = '/fill_screen';
  const FillInfoScreen({super.key});

  @override
  State<FillInfoScreen> createState() => _FillInfoScreenState();
}

class _FillInfoScreenState extends State<FillInfoScreen> {
  final countryPicker = const FlCountryCodePicker();
  final TextEditingController nameController = TextEditingController();
  String nickName = '';
  TextEditingController genderController = TextEditingController();
  TextEditingController selectedDOB = TextEditingController();
  CountryCode? countryCode;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, 11),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDOB.text = DateFormat('yyyy/MM/dd').format(picked);
      });
    }
  }

  ImageProvider imageProvider =
      const AssetImage('assets/images/onboarding/imagePlaceholder.jpeg');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                BlocConsumer<ImagePickerCubit, String?>(
                  listener: (context, state) => {
                    if (state !=
                        'assets/images/onboarding/imagePlaceholder.jpeg')
                      {
                        imageProvider = FileImage(
                          File(state!),
                        ),
                      }
                  },
                  builder: (context, state) {
                    final imageCubit = context.read<ImagePickerCubit>();

                    return Stack(
                      children: [
                        CircleAvatar(
                            radius: 80.r, backgroundImage: imageProvider),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              imageCubit.pickImage(ImageSource.gallery);
                            },
                            child: CircleAvatar(
                              backgroundColor: theme.primaryColor,
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                TextFormBox(
                  autovalidateMode: AutovalidateMode.disabled,
                  theme: theme,
                  onChanged: (String value) {},
                  controller: nameController,
                  labelText: 'Full name',
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return 'Your name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFormBox(
                  autovalidateMode: AutovalidateMode.disabled,
                  theme: theme,
                  onChanged: (String value) {
                    nickName = value;
                  },
                  labelText: 'Nickname',
                  validator: (String? value) {},
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFormBox(
                  readOnly: true,
                  controller: selectedDOB,
                  onTap: () async {
                    await _selectDate(context);
                  },
                  autovalidateMode: AutovalidateMode.disabled,
                  theme: theme,
                  onChanged: (String value) {},
                  labelText: 'DOB',
                  suffixIcon: 'assets/images/onboarding/dob.png',
                  validator: (String? value) {},
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                    prefixIcon: GestureDetector(
                      onTap: () async {
                        final code =
                            await countryPicker.showPicker(context: context);
                        if (code != null) {
                          setState(() {
                            countryCode = code;
                          });
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5.w, right: 3.w),
                            child: countryCode?.flagImage,
                          ),
                          Text(
                            countryCode?.dialCode ?? '+1',
                            style: theme.textTheme.bodyText1,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: theme.primaryColor,
                          )
                        ],
                      ),
                    ),
                    fillColor: const Color(0xFFF8F8F8),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Color(0xff575C60),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Color(0xff6F5FF8),
                        width: 0.6,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 0.2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Color(0xff575C60),
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFormBox(
                  readOnly: true,
                  controller: genderController,
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      context: context,
                      builder: (context) => Container(
                        height: 200.h,
                        decoration: const BoxDecoration(),
                        child: Column(
                            children: List.generate(2, (index) {
                          return ListTile(
                            onTap: () {
                              index == 0
                                  ? Navigator.of(context).pop('male')
                                  : Navigator.of(context).pop('female');
                            },
                            leading: index == 0
                                ? const Icon(Icons.male)
                                : const Icon(Icons.female),
                            title: index == 0
                                ? Text(
                                    'Male',
                                    style: theme.textTheme.bodyText1,
                                  )
                                : Text(
                                    'Female',
                                    style: theme.textTheme.bodyText1,
                                  ),
                          );
                        })),
                      ),
                    ).then(
                      (pickedGender) => {
                        if (pickedGender != null)
                          {
                            if (pickedGender == 'male')
                              {
                                setState(() {
                                  genderController.text = 'Male';
                                })
                              }
                            else
                              {
                                setState(
                                  () {
                                    genderController.text = 'Female';
                                  },
                                )
                              }
                          }
                      },
                    );
                  },
                  autovalidateMode: AutovalidateMode.disabled,
                  theme: theme,
                  onChanged: (String value) {},
                  labelText: 'Gender',
                  suffixIcon: 'assets/images/onboarding/arrow_down.png',
                  validator: (String? value) {},
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GlobalMethods.materialButton(
                        onPressed: () => Navigator.of(context).pushNamed(
                          InterestScreen.routeName,
                        ),
                        child: 'Continue',
                        theme: theme,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
