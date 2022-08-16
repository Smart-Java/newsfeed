import 'package:flutter/material.dart';

class SearchNewsWidget extends StatefulWidget {
  final TextEditingController? searchTextEdittingController;
  const SearchNewsWidget({Key? key, this.searchTextEdittingController}) : super(key: key);

  @override
  State<SearchNewsWidget> createState() => _SearchNewsWidgetState();
}

class _SearchNewsWidgetState extends State<SearchNewsWidget> {
  // final searchTextEdittingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchTextEdittingController,
      textInputAction: TextInputAction.search,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          hintText: 'Search for news',
          hintStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          )),
      onSubmitted: (value) {},
    );
  }
}
