import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_app/Paths/APIs/api_paths.dart';

class TagController extends GetxController {
  var isLoading = false.obs;
  List? tagsList;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(
          headers: {
            'X-RapidAPI-Key': '4125166edamsh1f1046759a58aa9p19ba8ejsndf5c5eba5b36',
            'X-RapidAPI-Host': 'famous-quotes4.p.rapidapi.com'
          },
          Uri.tryParse(API.host)!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
print(result);
        tagsList = result;
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}