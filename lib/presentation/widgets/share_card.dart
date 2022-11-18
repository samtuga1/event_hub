import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareCard extends StatelessWidget {
  const ShareCard({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: const Color(0xffD6FCFD),
        ),
        height: 120.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invite your friends',
                  style: theme.textTheme.headline2,
                ),
                Text(
                  'Get 20 GHS for ticket',
                  style: theme.textTheme.labelMedium,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xff00F8FF),
                  ),
                  child: Text(
                    'Share',
                    style: theme.textTheme.headline2?.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/explore/share.png',
              height: 100.h,
            )
          ],
        ),
      ),
    );
  }
}
