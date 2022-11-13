import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalMethods {
  // GLOBAL BUTTON
  static MaterialButton materialButton({
    required Function() onPressed,
    required String child,
    required ThemeData theme,
  }) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      elevation: 0,
      minWidth: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      enableFeedback: false,
      highlightElevation: 0,
      onPressed: onPressed,
      color: theme.buttonColor,
      child: Center(
        child: Text(
          child,
          style: theme.textTheme.button?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

// GLOBAL APP BAR
  static AppBar globalAppBar(
    String? title,
  ) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: true,
      centerTitle: false,
      title: Text(
        title ?? '',
      ),
    );
  }

  // ALERT DIALOG FROM PACKAGE
  // static showStatusDialog({
  //   required BuildContext context,
  //   required String message,
  //   Function()? onConfirmBtnTap,
  //   String? confirmBtxText,
  //   required QuickAlertType status,
  // }) {
  //   return QuickAlert.show(
  //     context: context,
  //     type: status,
  //     text: message,
  //     confirmBtnText: confirmBtxText ?? 'Okay',
  //     onConfirmBtnTap: onConfirmBtnTap,
  //   );
  // }
}
