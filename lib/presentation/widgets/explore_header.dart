import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Image.asset('assets/images/explore/search.png'),
              labelText: 'Search for...',
              labelStyle: theme.textTheme.labelMedium,
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/explore/filter.png',
                  scale: 1,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
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
      ),
    );
  }
}
