// coverage:ignore-start
import 'package:flutter/material.dart';

import '../../domain/entities/watchlist.dart';
import '../utils/widget_keys.dart';
import '../widgets/entertainment_card/entertainment_card.dart';

abstract class RawListPage extends StatelessWidget {
  const RawListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody();

  Widget showInitialState() {
    return const SizedBox(key: kInitialWidgetKey);
  }

  Widget showLoading() {
    return const Center(
      key: kShimmerKey,
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget showErrorMessage(message) {
    return Center(
      key: kErrorTextKey,
      child: Text(message),
    );
  }

  Widget showEmptyContent() {
    return const Center(
      key: kEmptyContentKey,
      child: Padding(
        padding: EdgeInsets.all(NavigationToolbar.kMiddleSpacing),
        child: Text('The content you are looking for was not found'),
      ),
    );
  }

  Widget showContents(List<Watchlist> entertainments) {
    return ListView.separated(
      key: kMainContentsKey,
      padding: const EdgeInsets.symmetric(
        horizontal: NavigationToolbar.kMiddleSpacing,
        vertical: NavigationToolbar.kMiddleSpacing * 2,
      ),
      itemBuilder: (context, index) {
        final data = entertainments[index];
        return EntertainmentCard.detailed(
          data,
          onTap: () => onCardTapped(context, data),
        );
      },
      itemCount: entertainments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6.0),
    );
  }

  void onCardTapped(BuildContext context, Watchlist data);
}
// coverage:ignore-end
