import 'package:animations/animations.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:event_hub/presentation/widgets/glass_container.dart';
import 'package:event_hub/presentation/widgets/icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/inner_screens/event_detail_screen.dart';

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
                  width: 260.w,
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
                            FittedBox(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 17,
                                    color: Color(0xff637381),
                                  ),
                                  Text(
                                    'Twifo Hemang Lower Denkyira',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        theme.textTheme.labelMedium?.copyWith(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/sark.jpg',
                        fit: BoxFit.fill,
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
                  child: GlassContainer(),
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
