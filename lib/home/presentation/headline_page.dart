import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsfeed/home/bloc/headline_bloc.dart';
import 'package:newsfeed/home/presentation/widget/custom_headline_list.dart';
import 'package:newsfeed/home/state/headline_page_state.dart';

import '../event/headline_event.dart';

class HeadlinePage extends StatefulWidget {
  final String? country;
  final String? searchTerms;
  const HeadlinePage({Key? key, this.country, this.searchTerms})
      : super(key: key);

  @override
  State<HeadlinePage> createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {
  bool general = false;
  bool business = false;
  bool entertainment = false;
  bool health = false;
  bool science = false;
  bool sports = false;
  bool technology = false;

  List headlineList = [];

  @override
  Widget build(BuildContext context) {
    return widget.country != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocProvider(
              create: (context) => HeadlineBloc()
                ..add(LoadHeadlineNewsDataEvent(
                    isLoading: true, country: widget.country)),
              child: headlineList.isNotEmpty
                  ? BlocBuilder<HeadlineBloc, HeadlinePageReadyState>(
                      bloc: HeadlineBloc()
                        ..add(LoadHeadlineNewsDataEvent(
                            isLoading: true,
                            country: widget.country,
                            headline: headlineList)),
                      builder: (context, state) {
                        return state.isLoading == true && state.message == null
                            ? Center(
                                child: loadingBar(),
                              )
                            : state.list!.isNotEmpty
                                ? SingleChildScrollView(
                                    physics: const ScrollPhysics(),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        newsHeadlineTitle(widget.country),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: CustomHeadlineList(
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
                    )
                  : widget.searchTerms != null
                      ? BlocBuilder<HeadlineBloc, HeadlinePageReadyState>(
                          bloc: HeadlineBloc()..add(SearchNewsEvent(searchValue: widget.searchTerms)),
                          builder: (context, state) {
                            return state.isLoading == true &&
                                    state.message == null
                                ? Center(
                                    child: loadingBar(),
                                  )
                                : state.list!.isNotEmpty
                                    ? SingleChildScrollView(
                                        physics: const ScrollPhysics(),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            newsHeadlineTitle(widget.country),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: CustomHeadlineList(
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
                        )
                      : BlocBuilder<HeadlineBloc, HeadlinePageReadyState>(
                          builder: (context, state) {
                            return state.isLoading == true &&
                                    state.message == null
                                ? Center(
                                    child: loadingBar(),
                                  )
                                : state.list!.isNotEmpty
                                    ? SingleChildScrollView(
                                        physics: const ScrollPhysics(),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            newsHeadlineTitle(widget.country),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: CustomHeadlineList(
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
                        ),
            ),
          )
        : Container();
  }

  CircularProgressIndicator loadingBar() {
    return const CircularProgressIndicator(
      backgroundColor: Colors.orange,
      color: Colors.grey,
    );
  }

  SingleChildScrollView newsHeadlineTitle(String? country) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selectedColor: Colors.orange,
              disabledColor: Colors.white,
              label: const Text('General'),
              selected: general,
              onSelected: (value) {
                setState(() {
                  general = value;
                });
                if (value == true) {
                  if (headlineList.contains('general') == false) {
                    headlineList.add('general');
                  }
                } else {
                  if (headlineList.contains('general') == true) {
                    headlineList.remove('general');
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selectedColor: Colors.orange,
              disabledColor: Colors.white,
              label: const Text('Business'),
              selected: business,
              onSelected: (value) {
                setState(() {
                  business = value;
                });
                if (value == true) {
                  if (headlineList.contains('business') == false) {
                    headlineList.add('business');
                  }
                } else {
                  if (headlineList.contains('business') == true) {
                    headlineList.remove('business');
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selectedColor: Colors.orange,
              disabledColor: Colors.white,
              label: const Text('Entertainment'),
              selected: entertainment,
              onSelected: (value) {
                setState(() {
                  entertainment = value;
                });
                if (value == true) {
                  if (headlineList.contains('entertainment') == false) {
                    headlineList.add('entertainment');
                  }
                } else {
                  if (headlineList.contains('entertainment') == true) {
                    headlineList.remove('entertainment');
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selectedColor: Colors.orange,
              disabledColor: Colors.white,
              label: const Text('Health'),
              selected: health,
              onSelected: (value) {
                setState(() {
                  health = value;
                });
                if (value == true) {
                  if (headlineList.contains('health') == false) {
                    headlineList.add('health');
                  }
                } else {
                  if (headlineList.contains('health') == true) {
                    headlineList.remove('health');
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selectedColor: Colors.orange,
              disabledColor: Colors.white,
              label: const Text('Science'),
              selected: science,
              onSelected: (value) {
                setState(() {
                  science = value;
                });
                if (value == true) {
                  if (headlineList.contains('science') == false) {
                    headlineList.add('science');
                  }
                } else {
                  if (headlineList.contains('science') == true) {
                    headlineList.remove('science');
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selectedColor: Colors.orange,
              disabledColor: Colors.white,
              label: const Text('Sports'),
              selected: sports,
              onSelected: (value) {
                setState(() {
                  sports = value;
                });
                if (value == true) {
                  if (headlineList.contains('sports') == false) {
                    headlineList.add('sports');
                  }
                } else {
                  if (headlineList.contains('sports') == true) {
                    headlineList.remove('sports');
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              selectedColor: Colors.orange,
              disabledColor: Colors.white,
              label: const Text('Technology'),
              selected: technology,
              onSelected: (value) {
                setState(() {
                  technology = value;
                });
                if (value == true) {
                  if (headlineList.contains('technology') == false) {
                    headlineList.add('technology');
                  }
                } else {
                  if (headlineList.contains('technology') == true) {
                    headlineList.remove('technology');
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
