import 'package:event_hub/presentation/widgets/event_tickets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<TicketsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      animationDuration: const Duration(milliseconds: 650),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text(
          'My Tickets',
          style: theme.textTheme.headline2?.copyWith(fontSize: 28.sp),
        ),
        bottom: TabBar(
          indicatorColor: theme.primaryColor,
          labelStyle: theme.textTheme.headline2?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w700,
          ),
          labelColor: Colors.black,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Upcoming',
            ),
            Tab(
              text: 'Past',
            ),
            Tab(
              text: 'Canceled',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // UPCOMING
          EventTickets(),
          // PAST
          EventTickets(),
          // CANCELED
          EventTickets(),
        ],
      ),
    );
  }
}
