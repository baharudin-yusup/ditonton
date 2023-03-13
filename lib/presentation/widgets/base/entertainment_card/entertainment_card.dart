import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:flutter/material.dart';

import '../../../pages/movie_detail_page.dart';
import '../../../pages/tv_show_detail_page.dart';

part 'entertainment_detail_card.dart';
part 'entertainment_simple_card.dart';

abstract class EntertainmentCard extends StatelessWidget {
  final Watchlist data;

  const EntertainmentCard(this.data, {Key? key}) : super(key: key);

  factory EntertainmentCard.simple(Watchlist data, {Key? key}) {
    return _SimpleCard(data, key: key ?? kSimpleEntertainmentCardKey);
  }

  factory EntertainmentCard.detailed(Watchlist data, {Key? key}) {
    return _DetailCard(data, key: key);
  }

  void openDetailPage(BuildContext context) async {
    switch (data.type) {
      case WatchlistType.movie:
        await Navigator.pushNamed(
          context,
          MovieDetailPage.routeName,
          arguments: data.id,
        );
        break;
      case WatchlistType.tvShow:
        await Navigator.pushNamed(
          context,
          TvShowDetailPage.routeName,
          arguments: data.id,
        );
        break;
    }
  }
}
