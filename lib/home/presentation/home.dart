import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsfeed/favorites/presentation/favorite-page.dart';
import 'package:newsfeed/home/bloc/country_bloc.dart';
import 'package:newsfeed/home/event/country_event.dart';
import 'package:newsfeed/home/presentation/headline_page.dart';
import 'package:newsfeed/home/presentation/widget/search_news.dart';
import 'package:newsfeed/home/state/country_state.dart';
import 'package:newsfeed/sources/presentation/source_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? countryValue;

  List? _appBarProperty;

  int index = 0;

  bool? _isApplied;

  bool? _searchApplied;

  bool? _searchBar;

  final searchNewsController = TextEditingController();

  @override
  void initState() {
    index = 0;

    countryValue = 'us';

    _isApplied = false;

    _searchApplied = false;

    _searchBar = false;

    _appBarProperty = [
      {
        'name': 'Headline',
        'isIcon': true,
        'widget': HeadlinePage(
          country: countryValue,
        )
      },
      {
        'name': 'Source',
        'isIcon': false,
        'widget': SourcePage(
          country: countryValue,
        )
      },
      {'name': 'Favourite', 'isIcon': false, 'widget': const FavoritePage()}
    ];
    super.initState();
  }

  void changeValue(value) {
    setState(() {
      countryValue = value;
    });
  }

  Widget updateWidget(String? country) {
    if (index == 0) {
      return HeadlinePage(
        country: country,
      );
    } else if (index == 1) {
      return SourcePage(
        country: country,
      );
    } else {
      return const FavoritePage();
    }
  }

  Widget updateWidgetForSearch(String? country, String searchTerms) {
    if (index == 0) {
      return HeadlinePage(
        country: country,
        searchTerms: searchTerms,
      );
    } else if (index == 1) {
      return SourcePage(
        country: country,
      );
    } else {
      return const FavoritePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    var title = _appBarProperty![index]['name'] as String;
    var isIcon = _appBarProperty![index]['isIcon'] as bool;
    var widgetType = _appBarProperty![index]['widget'] as Widget;

    return BlocProvider(
      create: (context) => CountryBloc(),
      child: Scaffold(
        appBar: _searchBar == false
            ? AppBar(
                backgroundColor: Colors.grey[900],
                title: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                actions: isIcon == true
                    ? [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _searchBar = true;
                              });
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Country Options'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              CountryBloc().add(
                                                  AddCountryToCountryEvent(
                                                      country: countryValue));
                                              setState(() {
                                                _isApplied = true;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Apply',
                                              style: TextStyle(
                                                  color: Colors.orange),
                                            )),
                                      ],
                                      content: SizedBox(
                                        height: 200.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Select Country'),
                                            ListTile(
                                              leading: Radio<String>(
                                                  value: 'aus',
                                                  groupValue: countryValue,
                                                  activeColor: Colors.orange,
                                                  onChanged: (value) {
                                                    changeValue(value);
                                                  }),
                                              title: const Text('Australia'),
                                            ),
                                            ListTile(
                                              leading: Radio<String>(
                                                  value: 'fr',
                                                  groupValue: countryValue,
                                                  activeColor: Colors.orange,
                                                  onChanged: (value) {
                                                    changeValue(value);
                                                    // ignore: avoid_print
                                                    print(countryValue);
                                                  }),
                                              title: const Text('France'),
                                            ),
                                            ListTile(
                                              leading: Radio<String>(
                                                  value: 'us',
                                                  groupValue: countryValue,
                                                  activeColor: Colors.orange,
                                                  onChanged: (value) {
                                                    changeValue(value);
                                                    // ignore: avoid_print
                                                    print(countryValue);
                                                  }),
                                              title:
                                                  const Text('United States'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.filter_list,
                              color: Colors.white,
                            ))
                      ]
                    : [],
              )
            : AppBar(
                backgroundColor: Colors.grey[900],
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _searchBar = false;
                    });
                  },
                ),
                title: TextField(
                  controller: searchNewsController,
                  textInputAction: TextInputAction.search,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Search for news',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      )),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _searchApplied = true;
                        print('this is $value');
                      });
                    }
                  },
                ),
              ),
        body: _isApplied == true
            ? BlocBuilder<CountryBloc, CountryState>(
                bloc: CountryBloc()
                  ..add(AddCountryToCountryEvent(country: countryValue)),
                builder: (context, state) {
                  countryValue = state.country;

                  return state.country != null
                      ? updateWidget(countryValue)
                      : Container();
                },
              )
            : _searchApplied == true
                ? updateWidgetForSearch(countryValue, searchNewsController.text)
                : widgetType,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey[900],
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                    icon: const Icon(
                      Icons.view_headline,
                    ),
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    }),
                label: 'Headline',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                    icon: const Icon(
                      Icons.source,
                    ),
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    }),
                label: 'Sources',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                    ),
                    onPressed: () {
                      setState(() {
                        index = 2;
                      });
                    }),
                label: 'Favorite',
              ),
            ]),
      ),
    );
  }
}
