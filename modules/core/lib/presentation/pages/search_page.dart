import 'package:core/presentation/pages/raw_list_page.dart';
import 'package:flutter/material.dart';

import '../utils/widget_keys.dart';

abstract class SearchPage extends RawListPage {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          key: kTexFieldKey,
          focusNode: _focusNode,
          controller: _controller,
          textAlignVertical: TextAlignVertical.center,
          maxLines: 1,
          onSubmitted: (query) => onSubmitted(context, query),
          decoration: const InputDecoration(
            hintText: 'Search',
            isDense: true,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(),
          ),
          textInputAction: TextInputAction.search,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => onSubmitted(context, _controller.text),
          ),
        ],
      ),
      body: buildBody(),
    );
  }

  @override
  Widget showInitialState() {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.screen_search_desktop_outlined,
                  size: 40,
                ),
                SizedBox(height: 12.0),
                Text('Start typing'),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget showFailure(String message) {
    return Center(
      child: Text(message),
    );
  }

  void onSubmitted(BuildContext context, String query);
}
