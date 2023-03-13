import 'package:flutter/material.dart';

const String BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500';

// colors
const Color kRichBlack = Color(0xFF000814);
const Color kOxfordBlue = Color(0xFF001D3D);
const Color kPrussianBlue = Color(0xFF003566);
const Color kMikadoYellow = Color(0xFFffc300);
const Color kDavysGrey = Color(0xFF4B5358);
const Color kGrey = Color(0xFF303030);

const kColorScheme = ColorScheme(
  primary: kMikadoYellow,
  primaryContainer: kMikadoYellow,
  secondary: kPrussianBlue,
  secondaryContainer: kPrussianBlue,
  surface: kRichBlack,
  background: kRichBlack,
  error: Colors.red,
  onPrimary: kRichBlack,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);

/// Messages
const kWatchlistAddSuccessMessage = 'Added to Watchlist';
const kWatchlistRemoveSuccessMessage = 'Removed from Watchlist';

/// Widget keys
const kWatchlistButtonKey = Key('watchlist_button');
const kShimmerKey = Key('shimmer');
const kSimpleEntertainmentCardKey = Key('simple_entertainment_card');
const kSearchButtonKey = Key('search_button');
const kTexFieldKey = Key('text_field');
