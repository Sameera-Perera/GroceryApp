import 'package:groceryapp/utils/const.dart';
import 'package:http/http.dart' as http;

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/category';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$baseUrl/api/category'));
    // print(response);
    return response;
  }
}
