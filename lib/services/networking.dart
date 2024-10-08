import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  final String url;
  Network(this.url);

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
     var data = response.body;
      return jsonDecode(data);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
