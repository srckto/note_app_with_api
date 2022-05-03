import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<http.Response> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
    // if (response.statusCode == 200) {
    //   return jsonDecode(response.body);
    // } else {
    //   return null;
    // }
  }

  static Future<http.Response> post({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    http.Response response = await http.post(Uri.parse(url), body: body);
    return response;
    // if (response.statusCode == 200) {
    // return jsonDecode(response.body);
    // } else {
    // return null;
    // }
  }

  static Future<http.Response> postWithImage({
    required String url,
    Map<String, dynamic>? body,
    File? image,
  }) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var length = await image!.length();
    var stream = http.ByteStream(image.openRead());
    var multiPartFile = http.MultipartFile(
      "image",
      stream,
      length,
      filename: image.path.split("/").last,
    );
    request.files.add(multiPartFile);

    body!.forEach((key, value) {
      request.fields[key] = value;
    });

    var myRequest = await request.send();

    var response = await http.Response.fromStream(myRequest);

    return response;
  }
}
