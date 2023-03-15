// coverage:ignore-start
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/constants.dart';
import '../../../domain/entities/entities.dart';
import '../../utils/widget_keys.dart';

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
}
// coverage:ignore-end
