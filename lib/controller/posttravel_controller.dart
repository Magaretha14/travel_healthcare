import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_healthcare/controller/travelhistory_controller.dart';
import 'package:travel_healthcare/model/posttravel_model.dart';

class PostTravelController {
  final String apiUrl = '$baseUrl/posttravel';

  Future<void> createTravelHistory(PostTravelModel postTravelModel) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null) {
        throw Exception('Bearer token not found in SharedPreferences');
      }

      print('Request Payload: ${jsonEncode(postTravelModel.toJson())}');
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(postTravelModel.toJson()),
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        print('Travel history created successfully');
      } else {
        print('Response body: ${response.body}');
        throw Exception('Failed to create travel history');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }
}