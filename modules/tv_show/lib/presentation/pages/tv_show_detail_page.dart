import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../domain/entities/entities.dart';
import '../blocs/blocs.dart';
import 'tv_show_recommendations_page.dart';

class TvShowDetailPage extends StatelessWidget {
  static const routeName = '/tv-show-detail';

  final int id;

  const TvShowDetailPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailBloc, TvShowDetailState>(
        builder: (context, state) {
      return state.when(
        initial: () => _showLoading(),
        fetchDataInProgress: () => _showLoading(),
        fetchDataSuccess: (movieDetail) => _showContent(movieDetail),
        fetchDataFailure: (message) => _showErrorMessage(message),
      );
    });
  }

  Widget _showLoading() {
    return const Center(
      key: kShimmerKey,
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget _showErrorMessage(String message) {
    return Center(
      key: kErrorTextKey,
      child: Text(message),
    );
  }

  Widget _showContent(TvShowDetail data) {
    return Stack(
      key: kMainContentsKey,
      alignment: Alignment.topCenter,
      children: [
        _showThumbnail(data.posterPath),
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: DraggableScrollableSheet(
              builder: (context, scrollController) {
                return ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Scaffold(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _showDraggableSymbol(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _showTitle(data.name),
                              const SizedBox(width: 6.0),
                              _showWatchlistButton(context, data),
                            ],
                          ),
                          const SizedBox(height: 2.0),
                          _showGenres(data.genres),
                          const SizedBox(height: 2.0),
                          _showRatingBar(data.voteAverage, data.voteCount),
                          const SizedBox(height: 2.0),
                          _showLatestSeason(data.latestSeason),
                          const SizedBox(height: 16),
                          _showOverview(data.overview),
                          const SizedBox(height: 16),
                          _showRecommendations(context, data.id),
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
        ),
        _showBackButton(),
      ],
    );
  }

  Widget _showDraggableSymbol() {
    return Builder(builder: (context) {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: const BorderRadius.all(Radius.circular(16.0))),
          height: 4,
          width: 48,
          margin: const EdgeInsets.only(bottom: 8.0),
        ),
      );
    });
  }

  Widget _showTitle(String title) {
    return Expanded(
      child: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: NavigationToolbar.kMiddleSpacing),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }

  Widget _showWatchlistButton(BuildContext context, TvShowDetail movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: NavigationToolbar.kMiddleSpacing),
      child:
          BlocConsumer<TvShowWatchlistStatusBloc, TvShowWatchlistStatusState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            fetchDataInProgress: () {},
            fetchDataSuccess: (_, message) =>
                _showSuccessMessage(context, message),
            fetchDataFailure: (message) =>
                _showFailureMessage(context, message),
          );
        },
        builder: (context, state) {
          final bool? isAddedToWatchlist = state.map(
            initial: (_) => null,
            fetchDataInProgress: (_) => null,
            fetchDataSuccess: (data) => data.isAddedToWatchlist,
            fetchDataFailure: (_) => false,
          );
          return WatchlistButton(
            isAddedToWatchlist,
            onButtonPressed: () => context
                .read<TvShowWatchlistStatusBloc>()
                .add(TvShowWatchlistStatusEvent.toggleWatchlistStarted(movie)),
          );
        },
      ),
    );
  }

  Widget _showLatestSeason(Season? latestSeason) {
    List<Widget> buildFragment(String title, String? data) {
      return [
        Builder(builder: (context) {
          return Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          );
        }),
        Text(
          data ?? 'No data',
        ),
        const SizedBox(height: 4.0),
      ];
    }

    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: NavigationToolbar.kMiddleSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Latest Season Information',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4.0),
            if (latestSeason == null)
              const Text(
                'No data',
              ),
            if (latestSeason != null) ...[
              ...buildFragment('Name', latestSeason.name),
              ...buildFragment(
                  'Release Year', latestSeason.airDate?.year.toString()),
              ...buildFragment(
                  'Total Episodes', latestSeason.episodeCount?.toString()),
            ],
          ],
        ),
      );
    });
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
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemSize: 16,
            ),
            const SizedBox(width: 8.0),
            Text(
              info,
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      );
    });
  }

  Widget _showThumbnail(String posterPath) {
    return Builder(builder: (context) {
      final screenWidth = MediaQuery.of(context).size.width;
      return CachedNetworkImage(
        alignment: Alignment.topCenter,
        imageUrl: 'https://image.tmdb.org/t/p/w500$posterPath',
        width: screenWidth,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
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
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
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

  Widget _showRecommendations(BuildContext context, int id) {
    context
        .read<TvShowRecommendationsBloc>()
        .add(TvShowRecommendationsEvent.fetchDataStarted(id));
    return BlocBuilder<TvShowRecommendationsBloc, TvShowRecommendationsState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: NavigationToolbar.kMiddleSpacing),
        child: Column(
          children: [
            Builder(
              builder: (context) => HomeSubheading(
                title: 'Recommendations',
                onSeeMorePressed: () {
                  Navigator.pushNamed(
                    context,
                    TvShowRecommendationsPage.routeName,
                    arguments: id,
                  );
                },
              ),
            ),
            state.when(
              initial: (_) => _showLoading(),
              fetchDataInProgress: (_) => _showLoading(),
              fetchDataSuccess: (movies, _) => EntertainmentHorizontalList(
                movies,
                onTap: (movie) => Navigator.pushNamed(
                    context, TvShowDetailPage.routeName,
                    arguments: movie.id),
              ),
              fetchDataFailure: (message, _) => _showErrorMessage(message),
            ),
          ],
        ),
      );
    });
  }

  Widget _showBackButton() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topLeft,
        child: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.surface,
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
        ),
      ),
    );
  }

  void _showSuccessMessage(BuildContext context, String? message) {
    if (message == null) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 500),
    ));
  }

  void _showFailureMessage(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
          );
        });
  }
}
