import 'dart:io';

import 'package:http/http.dart';
import 'package:pilot_app/Service/request_type.dart';

class Networking {
  final Client _client;

  Networking(this._client);

  Future<Response> request(
      {required RequestType type,
      required String path,
      required Map<String, dynamic> paramaters}) async {
    switch (type) {
      case RequestType.GET:
        return _client.get(Uri.parse(path));
        case RequestType.POST:
        return _client.post(Uri.parse(path),body: paramaters);

      default:
        return throw const HttpException('KHONG HO TRO');
    }
  }
}
