import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsfeed/sources/bloc/sources_bloc.dart';
import 'package:newsfeed/sources/event/source_event.dart';
import 'package:newsfeed/sources/presentation/widget/custom_source_list.dart';
import 'package:newsfeed/sources/state/source_state.dart';

class SourcePage extends StatefulWidget {
  final String? country;
  const SourcePage({Key? key, this.country}) : super(key: key);

  @override
  State<SourcePage> createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {

  int? catPosition;
  String? catValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (context) => SourceNewsDataBloc()
          ..add(LoadSourceNewsEvent(
              isLoading: true, country: widget.country ?? 'us')),
        child: catValue == null ? BlocBuilder<SourceNewsDataBloc, SourcePageReadyState>(
            builder: (context, state) {
          // ignore: avoid_print
          print(state.list);
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
                            padding: const EdgeInsets.only(top: 5.0),
                            child: newsSourceHeadlineTitle(context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: CustomSourceList(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ));
        }) : BlocBuilder<SourceNewsDataBloc, SourcePageReadyState>(
          bloc: SourceNewsDataBloc()
          ..add(LoadSourceNewsEvent(
              isLoading: true, country: widget.country ?? 'us', categoryList: catValue)),
            builder: (context, state) {
          // ignore: avoid_print
          print(state.list);
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
                            padding: const EdgeInsets.only(top: 5.0),
                            child: newsSourceHeadlineTitle(context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: CustomSourceList(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ));
        }),
      ),
    );
  }

  CircularProgressIndicator loadingBar() {
    return const CircularProgressIndicator(
      backgroundColor: Colors.orange,
      color: Colors.grey,
    );
  }

  SingleChildScrollView newsSourceHeadlineTitle(BuildContext context) {
    // var action = BlocProvider.of<SourceNewsDataBloc>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    catPosition = 1;
                    catValue = 'general';
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'General',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              catPosition == 1
                  ? const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SizedBox(
                        height: 5,
                        width: 'General'.length * 10,
                        child: Divider(
                          thickness: 5.0,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    catPosition = 2;
                    catValue = 'business';
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Business',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              catPosition == 2
                  ? const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SizedBox(
                        height: 5,
                        width: 'Business'.length * 10,
                        child: Divider(
                          thickness: 5.0,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    catPosition = 3;
                    catValue = 'entertainment';
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Entertainment',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              catPosition == 3
                  ? const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SizedBox(
                        height: 5,
                        width: 'Entertainment'.length * 10,
                        child: Divider(
                          thickness: 5.0,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    catPosition = 4;
                    catValue = 'health';
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Health',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              catPosition == 4
                  ? const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SizedBox(
                        height: 5,
                        width: 'Health'.length * 10,
                        child: Divider(
                          thickness: 5.0,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    catPosition = 5;
                    catValue = 'science';
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Science',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              catPosition == 5
                  ? const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SizedBox(
                        height: 5,
                        width: 'Science'.length * 10,
                        child: Divider(
                          thickness: 5.0,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    catPosition = 6;
                    catValue = 'sports';
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Sports',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              catPosition == 6
                  ? const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SizedBox(
                        height: 5,
                        width: 'Sports'.length * 10,
                        child: Divider(
                          thickness: 5.0,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    catPosition = 7;
                    catValue = 'technology';
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Technology',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              catPosition == 7
                  ? const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: SizedBox(
                        height: 5,
                        width: 'Technology'.length * 10,
                        child: Divider(
                          thickness: 5.0,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }
}
