import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:event_hub/consts/global_methods.dart';
import 'package:event_hub/presentation/screens/inner_screens/event_detail_screen.dart';
import 'package:event_hub/presentation/widgets/icon_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = TargetPlatform.iOS == theme.platform;

    return Scaffold(
      body: Column(
        children: [
          ExploreHeader(theme: theme),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular Events', style: theme.textTheme.headline2),
                      GlobalMethods.textButton(
                        isIos,
                        theme.textTheme.labelMedium?.copyWith(
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 240.h,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => EventCard(theme: theme),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                    itemCount: 7,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ShareCard(theme: theme),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Upcoming Events', style: theme.textTheme.headline2),
                      GlobalMethods.textButton(
                        isIos,
                        theme.textTheme.labelMedium?.copyWith(
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 240.h,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => EventCard(theme: theme),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                    itemCount: 7,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nearby you', style: theme.textTheme.headline2),
                      GlobalMethods.textButton(
                        isIos,
                        theme.textTheme.labelMedium?.copyWith(
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 240.h,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => EventCard(theme: theme),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                    itemCount: 7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          borderRadius: BorderRadius.circular(20),
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

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 500),
      closedBuilder: (context, openWidget) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: GestureDetector(
            onTap: openWidget,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.r,
                        offset: const Offset(2, 5),
                        color: Colors.grey.shade200,
                      ),
                    ],
                  ),
                  height: 230.h,
                  width: 270.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GridTile(
                      footer: Container(
                        padding: const EdgeInsets.all(5),
                        color: Colors.white,
                        height: 100.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Wine testing',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: theme.textTheme.headline2?.copyWith(
                                fontSize: 19.sp,
                              ),
                            ),
                            Row(
                              children: [
                                AvatarStack(
                                  width: 80.w,
                                  height: 30.h,
                                  avatars: [
                                    for (var n = 0; n < 3; n++)
                                      const AssetImage(
                                        'assets/images/onboarding/imagePlaceholder.jpeg',
                                      ),
                                  ],
                                ),
                                Text(
                                  '+20 going',
                                  style: theme.textTheme.bodyText1?.copyWith(
                                    fontSize: 15.sp,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 17,
                                  color: Color(0xff637381),
                                ),
                                FittedBox(
                                  clipBehavior: Clip.antiAlias,
                                  child: Text(
                                    'Twifo Hemang Lower Denkyira',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        theme.textTheme.labelMedium?.copyWith(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          Text(
                            '10',
                            style: theme.textTheme.bodyText1?.copyWith(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 19.sp,
                            ),
                          ),
                          Text(
                            'JUNE',
                            style: theme.textTheme.bodyText1?.copyWith(
                              color: Colors.red,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 10,
                  top: 10,
                  child: IconContainer(
                    icon: Icons.bookmark,
                    bgColor: Colors.white,
                    iconColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      openBuilder: (context, closeWidget) {
        return EventDetail(
          popScreen: closeWidget,
        );
      },
    );
  }
}

class ExploreHeader extends StatelessWidget {
  ExploreHeader({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  final List<String> interests = [
    'Music 🎧️',
    'Food 🥗',
    'Party 🥂',
    'Sports ⚽️',
    'Movies 🎬️',
    'Arts 🎭️',
    'Gaming🎮',
    'Others 🏹'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 45, left: 15, right: 15),
          height: 250.h,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  color: Colors.white,
                  icon: const Icon(Icons.menu),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Current location',
                      style: theme.textTheme.labelMedium
                          ?.copyWith(color: Colors.white54),
                    ),
                    Text(
                      'Jukwa',
                      style: theme.textTheme.bodyText1
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: Color(0xff645FEF),
                  child: Icon(
                    Icons.notifications,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: theme.textTheme.bodyText1,
              // controller: searchController,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 5,
                ),
                labelText: 'Search...',
                labelStyle: theme.textTheme.labelMedium
                    ?.copyWith(color: Colors.white54),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color(0xff645FEF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none,
                ),
              ),
              //  onTap: openWidget,
            ),
          ]),
        ),
        Positioned.fill(
          bottom: -240.h,
          child: ListView.separated(
            itemCount: interests.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Chip(
                labelPadding: const EdgeInsets.all(6),
                backgroundColor: const Color(0xffFFF4EE),
                label: Text(
                  interests[i],
                  style: theme.textTheme.bodyText1,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
          ),
        ),
      ],
    );
  }
}
