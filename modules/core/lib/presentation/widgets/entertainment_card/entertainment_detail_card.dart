part of 'entertainment_card.dart';

class _DetailCard extends EntertainmentCard {
  const _DetailCard(
    super.data, {
    super.key,
    super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          onTap: onTap,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: 140,
                child: Column(
                  children: [
                    _showEntertainmentType(),
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            left: 16 + 80 + 16,
                            top: 8,
                            bottom: 16,
                            right: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                data.overview.isNotEmpty
                                    ? data.overview
                                    : 'No data',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: '$kBaseImageUrl${data.posterPath}',
                    width: 80,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showEntertainmentType() {
    return Builder(
      builder: (context) {
        late final Color background;
        late final Color foreground;
        late final String type;
        switch (data.type) {
          case WatchlistType.movie:
            background = Theme.of(context).colorScheme.secondary;
            foreground = Theme.of(context).colorScheme.onSecondary;
            type = 'Movie';
            break;
          case WatchlistType.tvShow:
            background = Theme.of(context).colorScheme.tertiary;
            foreground = Theme.of(context).colorScheme.onTertiary;
            type = 'TV Show';
            break;
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: background,
              ),
              child: Text(
                type,
                style: TextStyle(
                  color: foreground,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
