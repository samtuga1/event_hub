import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          ExploreHeader(theme: theme),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Upcoming Events', style: theme.textTheme.headline2),
                Text(
                  'See all...',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1.r,
                  blurRadius: 30.r,
                  color: const Color(0xFF1E1E1E).withOpacity(0.1),
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
                        'Wine testinghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                        overflow: TextOverflow.ellipsis,
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
                          Text(
                            'University of Ghana',
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontSize: 16.sp,
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
          )
        ],
      ),
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
          height: 260.h,
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
