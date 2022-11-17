import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Ticket extends StatelessWidget {
  static const routeName = '/ticket';
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xff607D8B),
      appBar: AppBar(
        backgroundColor: const Color(0xff607D8B),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            CupertinoIcons.chevron_back,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        title: Text(
          'My Tickets',
          style: theme.textTheme.headline2?.copyWith(
            fontSize: 28.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: TicketWidget(
            width: MediaQuery.of(context).size.width - 50,
            height: MediaQuery.of(context).size.height - 35,
            isCornerRounded: false,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/sark.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
