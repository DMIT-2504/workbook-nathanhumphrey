import 'dart:convert';
import 'package:http/http.dart' as http;

/// Returns JSON from the [endpoint]
Future<dynamic> getJson(String endpoint) async {
  final res = await http.get(Uri.parse(endpoint));
  final data = jsonDecode(res.body);
  return data;
}
