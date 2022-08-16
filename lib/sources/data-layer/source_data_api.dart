import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SourceNewsDataLayer{

  Future getSourceNews(api) async{
    Map? dataObject;
      try {
        var url = Uri.parse(api);
        var response = await http.get(url);
        var status = response.statusCode;
        switch (status) {
          case 200:
            var list = convert.jsonDecode(response.body);
            var listObject = list['sources'] as List;
            dataObject = {
              'message': 'success',
              'isLoading': false,
              'list': listObject
            };
            break;
          case 404:
            dataObject = {'message': 'Error occured, check your internet connection', 'isLoading': false, 'list': []};
            break;
          default:
        }
      } catch (e) {
        dataObject = {'message': 'Error occured, check your internet connection', 'isLoading': false, 'list': []};
      }

    return dataObject;
  }
}