import 'package:flutter/material.dart';

import 'raw_list_page.dart';

abstract class EntertainmentListPage extends RawListPage {
  final String title;

  const EntertainmentListPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildBody(),
    );
  }
}
