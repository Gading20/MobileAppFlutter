import 'package:deteksi_bacaan/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController extends GetxController {
  Future<void> register(String name, String email, String age, String gender,
      String password, String rePassword) async {
    final url = Uri.parse(
        'http://172.20.10.4:5000/register'); // Ganti dengan IP address komputer Anda
    final headers = {"Content-Type": "application/json"};
    final body = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "re_password": rePassword,
      "age": age,
      "gender": gender
    });

    print("Attempting to register with: $body");

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        // Jika registrasi berhasil
        print("Registration successful");
        Get.offAllNamed(Routes
            .LOGIN); // Navigasi ke halaman login setelah berhasil registrasi
      } else {
        // Jika registrasi gagal
        final responseData = json.decode(response.body);
        print("Registration failed: ${responseData['message']}");
        Get.snackbar(
            'Error', 'Registration failed: ${responseData['message']}');
      }
    } catch (e) {
      // Menangani error
      print("Error during registration: $e");
      Get.snackbar('Error', 'Error during registration: $e');
    }
  }
}
