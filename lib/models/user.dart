import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<User>> fetchUser() async {
  final res =
      await http.get('https://gentle-crag-48339.herokuapp.com/api/users');
  if (res.statusCode == 200) {
    print(res.body);
    final parsed = jsonDecode(res.body).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  } else {
    throw Exception("Failed to fetch");
  }
}

class User {
  final String id;
  final String name, email;
  final DateTime created;
  final DateTime updated;
  final bool educator;

  User(
      {this.id,
      this.name,
      this.email,
      this.created,
      this.updated,
      this.educator});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      created: DateTime.parse(json['created']),
      updated: json['updated'] == null ? null : DateTime.parse(json['updated']),
      educator: json['educator'],
    );
  }
}
