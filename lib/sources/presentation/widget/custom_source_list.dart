import 'package:flutter/material.dart';
import 'package:newsfeed/sources/presentation/source_detail_page.dart';

class CustomSourceList extends StatelessWidget {
  final List? list;

  const CustomSourceList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list!.length,
        itemBuilder: (context, index) {
          var id = list![index]['id'];
          var title = list![index]['name'];
          var description = list![index]['description'];

          // // ignore: avoid_print
          // print(title);
          // // ignore: avoid_print
          // print(description);
          // // ignore: avoid_print
          // print(index);

          return InkWell(
            onTap: () {
              // ignore: avoid_print
              print(description ?? '');
              Navigator.pushNamed(context, SourceDetailPage.sourceDetailPage,
                  arguments: {'title': title, 'id': id});
            },
            child: Card(
              color: Colors.white,
              elevation: 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0),
                          child: Text(
                            title,
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0),
                          child: Text(
                            'No title given',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                  description != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, left: 10.0),
                          child: Text(description,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal)),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('No description given',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal)),
                        ),
                ],
              ),
            ),
          );
        });
  }
}
