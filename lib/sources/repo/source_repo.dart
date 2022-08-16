import 'package:newsfeed/api_endpoint_class.dart';
import 'package:newsfeed/sources/data-layer/source_data_api.dart';

class SourceRepo {
  final SourceNewsDataLayer sourceNewsDataLayer = SourceNewsDataLayer();

  Future fineTuneDataForRequest(String? country, String? category) async {
    Map? requestedReponse, repoReponse;
    String? apiEndPoint;
    if (country != null && category != null) {
      apiEndPoint =
          'https://newsapi.org/v2/top-headlines/sources?country=$country&category=$category&apiKey=8219659e980449339dcc4bd178115595';
      repoReponse = await sourceNewsDataLayer.getSourceNews(apiEndPoint);
      requestedReponse = repoReponse;
    } else if (country != null) {
      apiEndPoint =
          'https://newsapi.org/v2/top-headlines/sources?country=$country&apiKey=8219659e980449339dcc4bd178115595';
      repoReponse = await sourceNewsDataLayer.getSourceNews(apiEndPoint);
      requestedReponse = repoReponse;
    } else if (category != null) {
      apiEndPoint =
          'https://newsapi.org/v2/top-headlines/sources?category=$category&apiKey=8219659e980449339dcc4bd178115595';
      repoReponse = await sourceNewsDataLayer.getSourceNews(apiEndPoint);
      requestedReponse = repoReponse;
    } else {
      apiEndPoint = APIEndPointClass.headlineAPIEndpoint;
      repoReponse = await sourceNewsDataLayer.getSourceNews(apiEndPoint);
      requestedReponse = repoReponse;
    }

    return requestedReponse;
  }

  Future fineTuneDataFromSourceForRequest(String? sourceValue) async {
    Map? requestedReponse, repoReponse;
    String? apiEndPoint;
    if (sourceValue != null) {
      apiEndPoint =
          'https://newsapi.org/v2/top-headlines/sources?q=$sourceValue&apiKey=8219659e980449339dcc4bd178115595';
      repoReponse = await sourceNewsDataLayer.getSourceNews(apiEndPoint);
      requestedReponse = repoReponse;
    } 
    return requestedReponse;
  }
}
