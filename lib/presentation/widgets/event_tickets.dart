import 'package:event_hub/presentation/screens/inner_screens/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventTickets extends StatelessWidget {
  const EventTickets({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          Ticket.routeName,
        ),
        child: Container(
          color: Colors.transparent,
          padding:
              EdgeInsets.only(left: 20, right: 20, top: index == 0 ? 20 : 0),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 120.w,
                height: 80.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/sark.jpg'),
                  fit: BoxFit.fill,
                )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wine Tasting',
                  style: theme.textTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: theme.textTheme.labelMedium,
                        ),
                        Text(
                          'Fri June 8, 2022',
                          style: theme.textTheme.bodyText1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: theme.textTheme.labelMedium,
                        ),
                        Text(
                          '7:45AM',
                          style: theme.textTheme.bodyText1,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(
        thickness: 0.5,
      ),
      itemCount: 10,
    );
  }
}
