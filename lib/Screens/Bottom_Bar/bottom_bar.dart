import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda1/Configs/app_constant.dart';
import 'package:grabpanda1/Screens/Components/my_behavior.dart';
import 'package:grabpanda1/Screens/Home_Screen/home_screen.dart';
import 'package:grabpanda1/Screens/Profile_Screen/profile_screen.dart';
import 'package:grabpanda1/Screens/Reservations_Screen/reservations_screen.dart';
import 'package:grabpanda1/Screens/Search_Screen/search_screen.dart';

class BottomBarScreen extends StatefulWidget{
  final int? tabIndex;

  const BottomBarScreen({Key? key, this.tabIndex}) : super(key: key);
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  PageController? _pageController;

  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.tabIndex ?? 0, keepPage: true);

    if (widget.tabIndex != null) {
      onTappedBar(widget.tabIndex!);
    }
    setState(() {});
  }

  void onTappedBar(int index) {
    setState(() {
      currentIndex = index;
      _pageController?.jumpToPage(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildPageView(context),
      bottomNavigationBar: _buildBottomNavigationBar(context, currentIndex),
    );
  }
  Widget _buildBottomNavigationBar(BuildContext context, int? currentTabIndex) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x00000012).withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        currentIndex: currentTabIndex ?? 0,
        unselectedItemColor: Color(0xFF5A5A5A),
        selectedLabelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Color(0xFF5A5A5A),
            fontSize: 12,
          ),
        ),
        items: [
          _buildItem(iconBottomBars[0], 'Home'),
          _buildItem(iconBottomBars[1], 'Search'),
          _buildItem(iconBottomBars[2], 'Reservations'),
          _buildItem(iconBottomBars[3], 'Profile'),
        ],
        onTap: (int index) {
          onTappedBar(index);
        },
      ),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (value) {
          onTappedBar(value);
        },
        children: [
          HomeScreen(),
          SearchScreen(),
          ReservationsScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(IconStatus icon, String? label) {
    return BottomNavigationBarItem(
      icon: Container(
        height: 40,
        padding: const EdgeInsets.only(bottom: 3, top: 10),
        child: Icon(
          icon.inactive,
        ),
      ),
      label: label!,
      activeIcon: Container(
        height: 40,
        child: Column(
          children: [
            Container(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 3, top: 3),
              child: Icon(icon.active),
            ),
          ],
        ),
      ),
    );
  }

  static List<IconStatus> iconBottomBars = [
    IconStatus(active: Icons.home, inactive: Icons.home),
    IconStatus(active: Icons.search, inactive: Icons.search),
    IconStatus(active: Icons.home_filled, inactive: Icons.home_filled),
    IconStatus(active: Icons.account_circle_outlined, inactive: Icons.account_circle_outlined),
  ];
}