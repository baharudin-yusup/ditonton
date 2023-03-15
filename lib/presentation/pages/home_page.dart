// coverage:ignore-start
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie.dart';
import 'package:tv_show/presentation/pages/tv_show_dashboard_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  HomePage({super.key});

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
// coverage:ignore-end
