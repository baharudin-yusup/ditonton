import 'package:flutter/material.dart';

import '../../domain/entities/watchlist.dart';
import 'entertainment_card/entertainment_card.dart';

class EntertainmentHorizontalList extends StatelessWidget {
  final List<Watchlist> datum;
  final void Function(Watchlist data)? onTap;

  const EntertainmentHorizontalList(this.datum, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(
          NavigationToolbar.kMiddleSpacing - 4,
          NavigationToolbar.kMiddleSpacing / 2,
          NavigationToolbar.kMiddleSpacing - 4,
          NavigationToolbar.kMiddleSpacing,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = datum[index];
          return EntertainmentCard.simple(
            data,
            onTap: onTap != null ? () => onTap!(data) : null,
          );
        },
        itemCount: datum.length,
      ),
    );
  }
}
