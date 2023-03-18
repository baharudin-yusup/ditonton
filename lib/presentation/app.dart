// coverage:ignore-start
import 'package:core/core.dart';
import 'package:core/init.dart';
import 'package:ditonton/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/blocs/blocs.dart';
import 'package:movie/presentation/routes/routes.dart';
import 'package:tv_show/presentation/blocs/blocs.dart';
import 'package:tv_show/presentation/routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieWatchlistBloc>(
            create: (_) =>
                locator()..add(MovieWatchlistEvent.fetchDataStarted())),
        BlocProvider<TvShowWatchlistBloc>(
            create: (_) =>
                locator()..add(TvShowWatchlistEvent.fetchDataStarted())),
      ],
      child: ThemeBuilder(
        builder: (light, dark) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ditonton',
          theme: light,
          darkTheme: dark,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (_) =>
                  getMoviePage(settings) ??
                  getTvShowPage(settings) ??
                  getGeneralPage(settings),
            );
          },
        ),
      ),
    );
  }
}
// coverage:ignore-end
