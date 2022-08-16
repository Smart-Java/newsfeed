import 'package:flutter/material.dart';

class CustomSourceDetailList extends StatelessWidget {
  final List? list;

  const CustomSourceDetailList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list!.length,
        itemBuilder: (context, index) {
          var title = list![index]['title'];
          var picture = list![index]['urlToImage'];
          var description = list![index]['description'];
          var websiteLink = list![index]['url'];
          var date = list![index]['publishedAt'];
          var content = list![index]['content'];

          var dateValue;

          // ignore: avoid_print
          print(list![index]['articlesFavorite']);

          return InkWell(
            onTap: () {
              // ignore: avoid_print
              print(content ?? '');
            },
            child: Card(
              color: Colors.white,
              elevation: 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  title != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0),
                          child: Text(
                            title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: picture != null
                          ? Image.network(
                              picture,
                              errorBuilder: (context, error, stackTrace) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 10.0),
                                  child: Center(
                                      child: Text(
                                    error.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  )),
                                );
                              },
                            )
                          : Container(),
                    ),
                  ),
                  description != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, left: 10.0),
                          child: Text(
                            description,
                            style: picture != null
                                ? const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal)
                                : const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'No Description given',
                            style: picture != null
                                ? const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal)
                                : const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                          ),
                        ),
                  websiteLink != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, left: 10.0),
                          child: Text(
                            websiteLink,
                            style: picture != null
                                ? const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal)
                                : const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'No website link given',
                            style: picture != null
                                ? const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal)
                                : const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                          ),
                        ),
                  Row(
                    children: [
                      Expanded(
                          child: date != null
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    date,
                                    style: picture != null
                                        ? const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal)
                                        : const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'No news date given',
                                    style: picture != null
                                        ? const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal)
                                        : const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                  ),
                                )),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
