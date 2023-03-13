import 'package:flutter/material.dart';

import '../../../common/constants.dart';

class WatchlistButton extends StatelessWidget {
  final bool isAddedWatchlist;
  final Future<String> Function() onButtonPressed;

  const WatchlistButton(
    this.isAddedWatchlist, {
    Key? key,
    required this.onButtonPressed,
  }) : super(key: key ?? kWatchlistButtonKey);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isAddedWatchlist
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.onBackground,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          backgroundColor: isAddedWatchlist
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background,
          foregroundColor: isAddedWatchlist
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onBackground,
          child: InkWell(
            onTap: () async {
              final message = await onButtonPressed();
              if (message == kWatchlistAddSuccessMessage ||
                  message == kWatchlistRemoveSuccessMessage) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(message),
                      );
                    });
              }
            },
            child: isAddedWatchlist
                ? Icon(Icons.bookmark_added)
                : Icon(Icons.bookmark_add_outlined),
          ),
        ),
      ),
    );
  }
}
