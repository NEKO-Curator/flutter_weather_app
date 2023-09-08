import 'package:http/http.dart' as http;

class HttpNetworkClient {
  final http.Client _client;
  HttpNetworkClient(this._client);

  get client => _client;
}
