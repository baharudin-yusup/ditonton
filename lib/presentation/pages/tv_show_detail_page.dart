import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/season.dart';
import 'package:core/presentation/widgets/entertainment_horizontal_list.dart';
import 'package:core/presentation/widgets/home_subheading.dart';
import 'package:core/presentation/widgets/watchlist_button.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_show_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class TvShowDetailPage extends StatelessWidget {
  static const routeName = '/tv-show-detail';

  final int id;

  const TvShowDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TvShowDetailNotifier>(
        builder: (context, provider, child) {
          if (provider.detailState == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.detailState == RequestState.Loaded) {
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

  Widget _showContent(TvShowDetailNotifier provider) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _showThumbnail(),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
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
                            _showTitle(provider.detail.name),
                            SizedBox(width: 6.0),
                            _showWatchlistButton(provider),
                          ],
                        ),
                        SizedBox(height: 2.0),
                        _showGenres(provider.detail.genres),
                        SizedBox(height: 4.0),
                        _showRatingBar(provider.detail.voteAverage,
                            provider.detail.voteCount),
                        SizedBox(height: 16.0),
                        _showLatestSeason(provider.detail.latestSeason),
                        SizedBox(height: 16),
                        _showOverview(provider.detail.overview),
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

  Widget _showWatchlistButton(TvShowDetailNotifier provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: NavigationToolbar.kMiddleSpacing),
      child: WatchlistButton(
        provider.isAddedToWatchlist,
        onButtonPressed: provider.toggleWatchlist,
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
        SizedBox(height: 4.0),
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
            SizedBox(height: 4.0),
            if (latestSeason == null)
              Text(
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

  Widget _showThumbnail() {
    return Consumer<TvShowDetailNotifier>(builder: (context, provider, child) {
      final screenWidth = MediaQuery.of(context).size.width;
      return CachedNetworkImage(
        alignment: Alignment.topCenter,
        imageUrl:
            'https://image.tmdb.org/t/p/w500${provider.detail.posterPath}',
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

  Widget _showRecommendations(TvShowDetailNotifier provider) {
    final datum = provider.recommendations;
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
                // TODO: Implement this
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) =>
                //         EntertainmentListPage<TvShowRecommendationsNotifier>(
                //       title: 'Recommendations',
                //       id: provider.detail.id,
                //     ),
                //   ),
                // );
              },
            ),
          ),
          Builder(builder: (context) {
            switch (state) {
              case RequestState.Loading:
              case RequestState.Loaded:
                return EntertainmentHorizontalList(datum);
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
