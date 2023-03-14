import 'package:flutter/material.dart';
import 'package:movie/movie.dart';
import 'package:tv_show/presentation/pages/pages.dart';

class WatchlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watchlist'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Movies'),
              Tab(text: 'TV Shows'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MovieWatchlistPage(),
            TvShowWatchlistPage(),
          ],
        ),
      ),
    );
  }
}
