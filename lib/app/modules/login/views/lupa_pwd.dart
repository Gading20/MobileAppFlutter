import 'package:deteksi_bacaan/app/constans/color.dart';
import 'package:deteksi_bacaan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class ForgotPasswordView extends GetView<LoginController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    // Menambahkan controller untuk TextFormField
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lupa Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Masukkan email Anda untuk menerima instruksi reset password",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silahkan masukan email anda';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Silahkan isi alamat email yang valid';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          final email = emailController.text;
                          final success =
                              await controller.resetPassword(email);
                          if (success) {
                            // Tampilkan notifikasi sukses atau navigasi ke halaman lain
                            Get.snackbar(
                              "Berhasil",
                              "Instruksi reset password telah dikirim ke email Anda",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        }
                      },
                      child: Text(
                        "Kirim Instruksi Reset Password",
                        style: TextStyle(
                            color: Get.isDarkMode ? appPurpleDark : appWhite),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Get.isDarkMode ? appWhite : appPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Kembali ke",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: () => Get.offAllNamed(Routes.LOGIN),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
