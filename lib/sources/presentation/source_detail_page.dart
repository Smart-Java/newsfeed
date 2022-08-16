import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsfeed/sources/bloc/sources_bloc.dart';
import 'package:newsfeed/sources/event/source_event.dart';
import 'package:newsfeed/sources/presentation/widget/custom_source_detail_list.dart';
import 'package:newsfeed/sources/state/source_state.dart';

class SourceDetailPage extends StatelessWidget {
  static const sourceDetailPage = '/sourceDetailPageRoute';
  const SourceDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentObject = ModalRoute.of(context)!.settings.arguments as Map;
    final title = argumentObject['title'];
    final id = argumentObject['id'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
            create: (context) => SourceNewsDataBloc()
              ..add(GetNewsBaseOnSourceEvent(
                  sourceValue: title, isLoading: true)),
            child: BlocBuilder<SourceNewsDataBloc, SourcePageReadyState>(
              builder: (context, state) {
                return state.isLoading == true && state.message == null
                    ? Center(
                        child: loadingBar(),
                      )
                    : state.list!.isNotEmpty
                        ? SingleChildScrollView(
                            physics: const ScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: CustomSourceDetailList(
                                    list: state.list,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Center(
                            child: Text(
                            '${state.message}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ));
              },
            )),
      ),
    );
  }

  CircularProgressIndicator loadingBar() {
    return const CircularProgressIndicator(
      backgroundColor: Colors.orange,
      color: Colors.grey,
    );
  }
}
