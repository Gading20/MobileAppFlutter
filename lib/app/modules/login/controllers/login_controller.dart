import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(
          'http://172.20.10.4:5000/login'), // Ganti dengan URL API Flask Anda
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // ignore: unused_local_variable
      final token = data['token_access'];
      // Simpan token jika perlu
      return true;
    } else {
      final data = jsonDecode(response.body);
      final message = data['message'];
      Get.snackbar('Login Gagal', message, snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    final url =
        'http://194.31.53.102:21095/forgot_password'; // Ganti dengan URL API Anda

    final response = await http.post(
      Uri.parse(url),
      body: {
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      // Tangani kesalahan
      Get.snackbar(
        "Error",
        "Gagal mengirim instruksi reset password. Silakan coba lagi.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
