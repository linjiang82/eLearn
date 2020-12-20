import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Map<String, dynamic>> signin(user) async {
  final res = await http.post(
    'https://gentle-crag-48339.herokuapp.com/auth/signin',
    headers: {
      'Accept': 'application/json',
      "Content-Type": 'application/json;charset=UTF-8'
    },
    body: jsonEncode(user),
  );
  return jsonDecode(res.body);
}

Future<Map<String, dynamic>> signup(user) async {
  final res = await http.post(
    'https://gentle-crag-48339.herokuapp.com/api/users',
    headers: {
      'Accept': 'application/json',
      "Content-Type": 'application/json;charset=UTF-8'
    },
    body: jsonEncode(user),
  );
  return jsonDecode(res.body);
}
