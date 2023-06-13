import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as CustomBadge;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(NazihApp());
}

class NazihApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nazih',
      theme: ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(), // Apply Google Fonts
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, // Remove debug banner
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => HomePage(), // Define the route for the HomePage
        // Add other routes if needed
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    ReportsPage(),
    OrganizationsPage(),
    EmergenciesPage(),
    FeedsPage(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.description,
    Icons.business,
    Icons.warning,
    Icons.rss_feed,
  ];

  final List<int> _badgeCounts = [0, 0, 2, 1, 0];

  @override
  Widget build(BuildContext context) {
    // Initialize the ScreenUtil instance
    ScreenUtil.init(context, designSize: Size(375, 812));

    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.orange,
        buttonBackgroundColor: Colors.orange,
        height: 60.0,
        items: _icons.map((IconData icon) {
          return Icon(icon, size: 30);
        }).toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Reports Page',
        style: TextStyle(fontSize: 24.sp),
      ),
    );
  }
}

class OrganizationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Organizations Page',
        style: TextStyle(fontSize: 24.sp),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Explore More',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeOptionCard(
                icon: 'assets/icons/assignment.svg',
                title: 'Latest Reports',
                badgeCount: 2,
                onTap: () {
                  // Implement the card's functionality here
                },
              ),
              HomeOptionCard(
                icon: 'assets/icons/local_hospital.svg',
                title: 'Emergency Services',
                onTap: () {
                  // Implement the card's functionality here
                },
              ),
              HomeOptionCard(
                icon: 'assets/icons/business.svg',
                title: 'Nearby Organizations',
                onTap: () {
                  // Implement the card's functionality here
                },
              ),
              HomeOptionCard(
                icon: 'assets/icons/article.svg',
                title: 'News & Updates',
                badgeCount: 1,
                onTap: () {
                  // Implement the card's functionality here
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EmergenciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Emergencies Page',
        style: TextStyle(fontSize: 24.sp),
      ),
    );
  }
}

class FeedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Feeds Page',
        style: TextStyle(fontSize: 24.sp),
      ),
    );
  }
}

class HomeOptionCard extends StatelessWidget {
  final String icon;
  final String title;
  final int badgeCount;
  final VoidCallback onTap;

  const HomeOptionCard({
    Key? key,
    required this.icon,
    required this.title,
    this.badgeCount = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    color: Colors.orange,
                    width: 48.w,
                    height: 48.w,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            badgeCount > 0
                ? Positioned(
              top: 4,
              right: 4,
              child: CustomBadge.Badge(
                badgeContent: Text(
                  badgeCount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: null,
                position: CustomBadge.BadgePosition.topEnd(top: 0, end: 3),
              ),
            )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
