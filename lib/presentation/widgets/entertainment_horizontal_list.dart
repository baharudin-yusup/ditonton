import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/widgets/base/entertainment_card/entertainment_card.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../../domain/entities/watchlist.dart';

class EntertainmentHorizontalList extends StatelessWidget {
  final List<Watchlist> datum;
  final RequestState state;

  EntertainmentHorizontalList(this.datum, this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(
          NavigationToolbar.kMiddleSpacing - 4,
          NavigationToolbar.kMiddleSpacing / 2,
          NavigationToolbar.kMiddleSpacing - 4,
          NavigationToolbar.kMiddleSpacing,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (state != RequestState.Loaded) {
            return buildShimmer(context);
          }

          final data = datum[index];
          return EntertainmentCard.simple(data);
        },
        itemCount: itemCount,
      ),
    );
  }

  int get itemCount {
    switch (state) {
      case RequestState.Loaded:
        return datum.length;
      default:
        return 5;
    }
  }

  Widget buildShimmer(BuildContext context) {
    return Padding(
      key: kShimmerKey,
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
          color: Theme.of(context)
              .colorScheme
              .secondaryContainer
              .withOpacity(0.15),
          height: 190,
          width: 190 * 2 / 3,
          alignment: Alignment.center,
          child: SizedBox.square(
            dimension: 30,
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }
}
