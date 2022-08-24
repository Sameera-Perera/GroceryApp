import 'package:groceryapp/utils/const.dart';
import 'package:http/http.dart' as http;

class RemoteBannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/banner';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$remoteUrl/1'));
    // print(response.body);
    return response;
  }
}
