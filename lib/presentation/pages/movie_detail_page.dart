import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list/movie_recomendations_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../widgets/base/home_subheading.dart';
import '../widgets/base/watchlist_button.dart';
import '../widgets/entertainment_horizontal_list.dart';
import 'entertainment_list_page.dart';

class MovieDetailPage extends StatelessWidget {
  static const routeName = '/movie-detail';

  final int id;

  const MovieDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MovieDetailNotifier>(
        builder: (context, provider, child) {
          final state = provider.movieState;
          if (state == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == RequestState.Loaded) {
            return SafeArea(
              child: _showContent(provider),
            );
          } else {
            return Text(provider.message);
          }
        },
      ),
    );
  }

  Widget _showContent(MovieDetailNotifier provider) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _showThumbnail(),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              final data = provider.movie;
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0))),
                            height: 4,
                            width: 48,
                            margin: EdgeInsets.only(bottom: 4.0),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _showTitle(data.title),
                            SizedBox(width: 6.0),
                            _showWatchlistButton(provider),
                          ],
                        ),
                        SizedBox(height: 2.0),
                        _showGenres(data.genres),
                        SizedBox(height: 2.0),
                        _showRatingBar(data.voteAverage, data.voteCount),
                        SizedBox(height: 2.0),
                        _showDuration(data.runtime),
                        SizedBox(height: 16),
                        _showOverview(data.overview),
                        SizedBox(height: 16),
                        _showRecommendations(provider),
                      ],
                    ),
                  ),
                ),
              );
            },
            initialChildSize: 0.5,
            minChildSize: 0.35,
          ),
        ),
        _showBackButton(),
      ],
    );
  }

  Widget _showTitle(String title) {
    return Expanded(
      child: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: NavigationToolbar.kMiddleSpacing),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }

  Widget _showWatchlistButton(MovieDetailNotifier provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: NavigationToolbar.kMiddleSpacing),
      child: WatchlistButton(
        provider.isAddedToWatchlist,
        onButtonPressed: () async {
          await provider.loadWatchlistStatus(id);

          if (provider.isAddedToWatchlist) {
            await provider.removeFromWatchlist(provider.movie);
          } else {
            await provider.addWatchlist(provider.movie);
          }

          return provider.watchlistMessage;
        },
      ),
    );
  }

  Widget _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    return Builder(
      builder: (context) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: NavigationToolbar.kMiddleSpacing),
        child: Row(
          children: [
            Icon(
              Icons.access_time_outlined,
              size: 16,
            ),
            SizedBox(width: 2.0),
            Text(
              '${hours > 0 ? '${hours}h ' : ''}${minutes}m',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _showRatingBar(double voteAverage, int voteCount) {
    return Builder(builder: (context) {
      final info =
          '$voteAverage ($voteCount ${voteCount > 1 ? 'votes' : 'vote'})';
      return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 4.0, horizontal: NavigationToolbar.kMiddleSpacing),
        child: Row(
          children: [
            RatingBarIndicator(
              rating: voteAverage / 2,
              itemCount: 5,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: kMikadoYellow,
              ),
              itemSize: 16,
            ),
            SizedBox(width: 8.0),
            Text(
              info,
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      );
    });
  }

  Widget _showThumbnail() {
    return Consumer<MovieDetailNotifier>(builder: (context, provider, child) {
      final screenWidth = MediaQuery.of(context).size.width;
      return CachedNetworkImage(
        alignment: Alignment.topCenter,
        imageUrl: 'https://image.tmdb.org/t/p/w500${provider.movie.posterPath}',
        width: screenWidth,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    });
  }

  Widget _showGenres(List<Genre> genres) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: NavigationToolbar.kMiddleSpacing),
      child: Wrap(
        spacing: 4.0,
        children: genres
            .map(
              (genre) => Chip(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                labelPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                label: Builder(
                  builder: (context) => Text(
                    genre.name,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _showOverview(String overview) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: NavigationToolbar.kMiddleSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              overview.isNotEmpty ? overview : 'No data',
            ),
          ],
        ),
      );
    });
  }

  Widget _showRecommendations(MovieDetailNotifier provider) {
    final datum = provider.movieRecommendations
        .map((recommendation) => recommendation.toWatchlist())
        .toList();
    final state = provider.recommendationState;
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: NavigationToolbar.kMiddleSpacing),
      child: Column(
        children: [
          Builder(
            builder: (context) => HomeSubheading(
              title: 'Recommendations',
              onSeeMorePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        EntertainmentListPage<MovieRecommendationsNotifier>(
                      title: 'Recommendations',
                      id: provider.movie.id,
                    ),
                  ),
                );
              },
            ),
          ),
          Builder(builder: (context) {
            switch (state) {
              case RequestState.Loading:
              case RequestState.Loaded:
                return EntertainmentHorizontalList(datum, state);
              default:
                return Text('Failed');
            }
          }),
        ],
      ),
    );
  }

  Widget _showBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor:
                Theme.of(context).colorScheme.surface.withOpacity(0.35),
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            child: IconButton(
              icon: Icon(Icons.adaptive.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
