part of 'entertainment_card.dart';

class _SimpleCard extends EntertainmentCard {
  const _SimpleCard(super.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => openDetailPage(context),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Container(
                  height: 190,
                  width: 190 * 2 / 3,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: '$BASE_IMAGE_URL${data.posterPath}',
                    placeholder: (context, url) => buildShimmer(context),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(height: 4.0),
              SizedBox(
                width: 190 * 2 / 3,
                child: Text(
                  data.name,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
