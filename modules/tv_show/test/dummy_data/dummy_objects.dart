import 'dart:convert';

import 'package:core/domain/entities/watchlist.dart';
import 'package:tv_show/data/models/models.dart';
import 'package:tv_show/domain/entities/entities.dart';

import '../json_reader.dart';

final testTvShowDetail = testTvShowDetailModel.toEntity();

final testTvShowTableMap = {
  "id": 1399,
  "title": 'Game of Thrones',
  'posterPath': '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  'overview':
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
  'type': 'tv_show',
};

final testTvShow = TvShow(
  id: 1399,
  name: 'Game of Thrones',
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  overview:
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
);

final testTvShowList = [testTvShow];

final testWatchlist = <Watchlist>[testTvShow];

const testTvShowTable = TvShowTable(
  id: 1399,
  title: 'Game of Thrones',
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  overview:
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
);

final testTvShowModel =
    TvShowModel.fromJson(jsonDecode(readJson('dummy_data/tv_show.json')));

final testTvShowDetailModel = TvShowDetailModel.fromJson(
    jsonDecode(readJson('dummy_data/tv_show_detail.json')));

final testSeason = Season(
  airDate: DateTime.parse("2010-12-05"),
  episodeCount: 64,
  id: 3627,
  name: "Specials",
  overview: "",
  posterPath: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
  seasonNumber: 0,
);
