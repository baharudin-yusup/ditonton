part of 'entertainment_card.dart';

class _DetailCard extends EntertainmentCard {
  _DetailCard(super.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          onTap: () => openDetailPage(context),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: 140,
                child: Column(
                  children: [
                    _showEntertainmentType(),
                    SizedBox(height: 8.0),
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
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
                              SizedBox(height: 8.0),
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
                  child: CachedNetworkImage(
                    imageUrl: '$BASE_IMAGE_URL${data.posterPath}',
                    width: 80,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
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
            Spacer(),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
