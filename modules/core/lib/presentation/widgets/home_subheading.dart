// coverage:ignore-start
import 'package:flutter/material.dart';

class HomeSubheading extends StatelessWidget {
  final String title;
  final void Function() onSeeMorePressed;

  const HomeSubheading(
      {Key? key, required this.title, required this.onSeeMorePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: NavigationToolbar.kMiddleSpacing),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        InkWell(
          onTap: onSeeMorePressed,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              8,
              4,
              8,
              4,
            ),
            child: Row(
              children: [
                Text(
                  'See More',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                const SizedBox(width: 4.0),
                Icon(Icons.adaptive.arrow_forward)
              ],
            ),
          ),
        ),
        const SizedBox(width: NavigationToolbar.kMiddleSpacing - 8),
      ],
    );
  }
}
// coverage:ignore-end
