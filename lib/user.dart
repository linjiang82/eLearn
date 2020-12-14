import 'package:http/http.dart' as http;

Future<User> fetchCourses() async {
  final res =
      await http.get('https://gentle-crag-48339.herokuapp.com/api/users');
  return res.body;
}
