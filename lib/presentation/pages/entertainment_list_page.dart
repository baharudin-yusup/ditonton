import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/injection.dart';
import 'package:ditonton/presentation/provider/entertainment_list_notifier.dart';
import 'package:ditonton/presentation/widgets/base/entertainment_card/entertainment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EntertainmentListPage<Notifier extends EntertainmentListNotifier>
    extends StatelessWidget {
  final String title;
  final int id;

  const EntertainmentListPage({
    Key? key,
    required this.title,
    this.id = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChangeNotifierProvider<Notifier>(
          create: (_) => locator()
            ..setId(id)
            ..fetch(),
          child: Consumer<Notifier>(
            builder: (context, data, child) {
              if (data.state == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.Loaded) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final movie = data.list[index];
                    return EntertainmentCard.detailed(movie);
                  },
                  itemCount: data.list.length,
                );
              } else {
                return Center(
                  key: Key('error_message'),
                  child: Text(data.message),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
