import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class UserRemoteDataSource {
  final String apiUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
