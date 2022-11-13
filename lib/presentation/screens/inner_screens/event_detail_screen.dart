import 'package:avatar_stack/avatar_stack.dart';
import 'package:event_hub/presentation/widgets/icon_container.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';

class EventDetail extends StatelessWidget {
  static const routeName = '/event_detail';
  const EventDetail({super.key, this.popScreen});
  final Function()? popScreen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        body: Column(
      children: [
        EventDetailHeader(
          theme: theme,
          popScreen: () {
            popScreen!();
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 7, 20, 10),
            children: [
              Text(
                'International Band Music Concert',
                style: theme.textTheme.bodyText1?.copyWith(fontSize: 40.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  IconContainer(
                    height: 50.h,
                    width: 50.w,
                    icon: Icons.calendar_month,
                    bgColor: theme.primaryColor.withOpacity(0.1),
                    iconColor: theme.primaryColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mon, May 25, 2022',
                        style: theme.textTheme.bodyText1,
                      ),
                      Text(
                        '10:00AM - 9:00PM',
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  IconContainer(
                    height: 45.h,
                    width: 45.w,
                    icon: Icons.explore,
                    bgColor: theme.primaryColor.withOpacity(0.1),
                    iconColor: theme.primaryColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Central Park',
                        style: theme.textTheme.bodyText1,
                      ),
                      Text(
                        'New York City',
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  IconContainer(
                    height: 45.h,
                    width: 45.w,
                    icon: Icons.confirmation_num,
                    bgColor: theme.primaryColor.withOpacity(0.1),
                    iconColor: theme.primaryColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '30GHS',
                    style: theme.textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: theme.textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ExpandableText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 5,
                    animation: true,
                    animationDuration: const Duration(milliseconds: 1500),
                    style: theme.textTheme.bodyText1,
                    linkColor: theme.primaryColor,
                    linkStyle:
                        theme.textTheme.bodyText1?.copyWith(fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gallery(Pre-Event)',
                    style: theme.textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 150.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        height: 150.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.h,
                      ),
                      itemCount: 8,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: CircleAvatar(radius: 30.r),
                title: Text(
                  'Sarkcess Music',
                  style: theme.textTheme.bodyText2,
                ),
                subtitle: Text(
                  'Organizer',
                  style: theme.textTheme.labelMedium,
                ),
                trailing: Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: theme.primaryColor,
                  ),
                  child: Text(
                    'Follow',
                    style: theme.textTheme.headline2?.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class EventDetailHeader extends StatelessWidget {
  const EventDetailHeader({
    Key? key,
    required this.theme,
    required this.popScreen,
  }) : super(key: key);

  final ThemeData theme;
  final Function() popScreen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 45, left: 7, right: 15),
          height: 250.h,
          decoration: BoxDecoration(
            color: theme.primaryColor,
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        popScreen();
                      },
                      color: Colors.white,
                      icon: const Icon(CupertinoIcons.chevron_back),
                    ),
                    Text(
                      'Event Details',
                      style: theme.textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 23.sp,
                      ),
                    ),
                  ],
                ),
                GlassmorphicContainer(
                  width: 40.w,
                  height: 40.h,
                  borderRadius: 7,
                  blur: 90,
                  alignment: Alignment.center,
                  border: 0,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.1),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ]),
        ),
        Positioned(
          bottom: -20,
          left: 50.w,
          child: Container(
            width: MediaQuery.of(context).size.width - 100.w,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.r,
                  offset: const Offset(0, 5),
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AvatarStack(
                      width: 90.w,
                      height: 30.h,
                      avatars: [
                        for (var n = 0; n < 5; n++)
                          const AssetImage(
                            'assets/images/onboarding/imagePlaceholder.jpeg',
                          ),
                      ],
                    ),
                    Text(
                      '+20 going',
                      style: theme.textTheme.bodyText1?.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: theme.primaryColor,
                  ),
                  child: Text(
                    'Invite',
                    style: theme.textTheme.headline2?.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
