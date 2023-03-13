import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/injection.dart';
import 'package:ditonton/presentation/provider/search_entertainment_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/base/entertainment_card/entertainment_card.dart';

class SearchPage<Notifier extends SearchEntertainmentNotifier>
    extends StatelessWidget {
  static Route route<Notifier extends SearchEntertainmentNotifier>() {
    return MaterialPageRoute(builder: (_) => SearchPage<Notifier>());
  }

  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Notifier>(
      create: (_) => locator(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: TextField(
            key: kTexFieldKey,
            focusNode: _focusNode,
            controller: _controller,
            textAlignVertical: TextAlignVertical.center,
            maxLines: 1,
            onSubmitted: (query) {
              context.read<Notifier>().search(query);
            },
            decoration: InputDecoration(
              hintText: 'Search',
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(),
            ),
            textInputAction: TextInputAction.search,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                context.read<Notifier>().search(_controller.text);
              },
            ),
          ],
        ),
        body: Consumer<Notifier>(
          builder: (context, data, _) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              final result = data.results;
              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: NavigationToolbar.kMiddleSpacing,
                  vertical: 24.0,
                ),
                itemBuilder: (context, index) {
                  return EntertainmentCard.detailed(result[index]);
                },
                itemCount: result.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 8.0);
                },
              );
            } else {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
            }
          },
        ),
      ),
    );
  }
}
