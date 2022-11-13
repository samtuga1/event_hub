import 'package:event_hub/presentation/screens/outer_screens/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/bottom_bar';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Widget> _pages = [
    ExploreScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Theme.of(context).textTheme.labelMedium!.color!,
                width: 0.2,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17.sp,
              fontFamily: 'Gilroy',
              color: Colors.black,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17.sp,
              fontFamily: 'Gilroy',
              color: const Color(0xff637381),
            ),
            onTap: _selectPage,
            unselectedItemColor: Theme.of(context).textTheme.labelMedium!.color,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.confirmation_num,
                ),
                label: 'Tickets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          hoverElevation: 10,
          backgroundColor: Theme.of(context).primaryColor,
          splashColor: Theme.of(context).textTheme.labelMedium!.color,
          tooltip: 'Search',
          elevation: 4,
          child: const Icon(Icons.add),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
