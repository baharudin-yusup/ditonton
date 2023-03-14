import 'package:flutter/material.dart';

import '../utils/widget_keys.dart';

class WatchlistButton extends StatelessWidget {
  final bool? isAddedWatchlist;
  final VoidCallback onButtonPressed;

  const WatchlistButton(
    this.isAddedWatchlist, {
    Key? key,
    required this.onButtonPressed,
  }) : super(key: key ?? kWatchlistButtonKey);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isAddedWatchlist ?? false
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.onBackground,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          backgroundColor: isAddedWatchlist ?? false
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background,
          foregroundColor: isAddedWatchlist ?? false
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onBackground,
          child: isAddedWatchlist == null
              ? _showLoading()
              : InkWell(
                  onTap: onButtonPressed,
                  child: isAddedWatchlist!
                      ? const Icon(Icons.bookmark_added)
                      : const Icon(Icons.bookmark_add_outlined),
                ),
        ),
      ),
    );
  }

  Widget _showLoading() {
    return const SizedBox.square(
      dimension: 20,
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
