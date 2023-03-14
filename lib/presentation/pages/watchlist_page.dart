import 'package:core/presentation/widgets/entertainment_card/entertainment_card.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie.dart';
import 'package:provider/provider.dart';

class WatchlistPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist';

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<WatchlistNotifier>()
      ..fetchWatchlistMovies()
      ..fetchTvShowsWatchlist());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    context.read<WatchlistNotifier>()
      ..fetchWatchlistMovies()
      ..fetchTvShowsWatchlist();
  }

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
            _showMoviesWatchlist(),
            _showTvShowsWatchlist(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  Widget _showMoviesWatchlist() {
    return MovieWatchlistPage();
  }

  Widget _showTvShowsWatchlist() {
    return Consumer<WatchlistNotifier>(
      builder: (context, data, child) {
        final state = data.tvShowsWatchlistState;
        final datum = data.tvShowsWatchlist;
        final message = data.moviesMessage;
        if (state == RequestState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == RequestState.Loaded) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: NavigationToolbar.kMiddleSpacing,
              vertical: 24.0,
            ),
            itemBuilder: (context, index) {
              return EntertainmentCard.detailed(datum[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8.0);
            },
            itemCount: datum.length,
          );
        } else {
          return Center(
            key: Key('error_message'),
            child: Text(message),
          );
        }
      },
    );
  }
}
