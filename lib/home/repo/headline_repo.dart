import 'package:newsfeed/api_endpoint_class.dart';
import 'package:newsfeed/home/data-layer/headline_data_layer.dart';

class HeadlineRepo {
  final HeadlineDataLayer headlineDataLayer = HeadlineDataLayer();

  Future fineTuneDataForRequest(String? country, String? category) async {
    Map? requestedReponse, repoReponse;
    String? apiEndPoint;
    if (country != null && category != null) {
      apiEndPoint =
          'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=8219659e980449339dcc4bd178115595';
      repoReponse = await headlineDataLayer.getHeadlineData(apiEndPoint);
      requestedReponse = repoReponse;
    } else if (country != null) {
      apiEndPoint =
          'https://newsapi.org/v2/top-headlines?country=$country&apiKey=8219659e980449339dcc4bd178115595';
      repoReponse = await headlineDataLayer.getHeadlineData(apiEndPoint);
      requestedReponse = repoReponse;
    } else if (category != null) {
      apiEndPoint =
          'https://newsapi.org/v2/top-headlines?category=$category&apiKey=8219659e980449339dcc4bd178115595';
      repoReponse = await headlineDataLayer.getHeadlineData(apiEndPoint);
      requestedReponse = repoReponse;
    } else {
      apiEndPoint = APIEndPointClass.headlineAPIEndpoint;
      repoReponse = await headlineDataLayer.getHeadlineData(apiEndPoint);
      requestedReponse = repoReponse;
    }

    return requestedReponse;
  }
  
  Future fineTuneDataForSearchRequest(String? searchValue) async {
    Map? requestedReponse, repoReponse;
    String? apiEndPoint;
    if (searchValue != null) {
      apiEndPoint =
          'https://newsapi.org/v2/top-headlines?q=$searchValue&apiKey=8219659e980449339dcc4bd178115595';
      repoReponse = await headlineDataLayer.getHeadlineData(apiEndPoint);
      requestedReponse = repoReponse;
    } 
    return requestedReponse;
  }
}
