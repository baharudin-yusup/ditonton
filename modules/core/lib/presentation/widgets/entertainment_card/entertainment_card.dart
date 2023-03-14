import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';
import 'package:core/presentation/utils/widget_keys.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

part 'entertainment_detail_card.dart';
part 'entertainment_simple_card.dart';

abstract class EntertainmentCard extends StatelessWidget {
  final Watchlist data;
  final VoidCallback? onTap;

  const EntertainmentCard(this.data, {Key? key, this.onTap})
      : super(key: key ?? kEntertainmentCardKey);

  factory EntertainmentCard.simple(Watchlist data,
      {Key? key, VoidCallback? onTap}) {
    return _SimpleCard(
      data,
      key: key,
      onTap: onTap,
    );
  }

  factory EntertainmentCard.detailed(Watchlist data,
      {Key? key, VoidCallback? onTap}) {
    return _DetailCard(
      data,
      key: key,
      onTap: onTap,
    );
  }

// TODO: Implement this
// void openDetailPage(BuildContext context) async {
//   switch (data.type) {
//     case WatchlistType.movie:
//       await Navigator.pushNamed(
//         context,
//         MovieDetailPage.routeName,
//         arguments: data.id,
//       );
//       break;
//     case WatchlistType.tvShow:
//       await Navigator.pushNamed(
//         context,
//         TvShowDetailPage.routeName,
//         arguments: data.id,
//       );
//       break;
//   }
// }
}
