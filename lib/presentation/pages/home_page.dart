import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie_dashboard_page.dart';
import 'package:ditonton/presentation/pages/tv_show_dashboard_page.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  NavigationBar buildBottomNavigationBar() {
    return NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: changeIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.movie_outlined),
            label: 'Movie',
          ),
          NavigationDestination(
            icon: Icon(Icons.tv_rounded),
            label: 'TV Show',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmarks_outlined),
            label: 'Watchlist',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ]);
  }

  Widget buildBody() {
    switch (_currentIndex) {
      case 0:
        return MovieDashboardPage();
      case 1:
        return TvShowDashboardPage();
      case 2:
        return WatchlistPage();
      case 3:
        return AboutPage();
      default:
        return MovieDashboardPage();
    }
  }

  void changeIndex(int index) {
    if (!mounted) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });
  }
}
