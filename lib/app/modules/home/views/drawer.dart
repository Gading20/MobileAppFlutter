import 'package:deteksi_bacaan/app/modules/home/views/list.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF2E0D8A),
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/images/logo.png', // Ganti dengan path gambar Anda
              width: 64,
              height: 64,
            ),
          ),
          List(
            icon: Icons.password_outlined,
            text: "Ubah Password",
            ontap: () => Navigator.pop(context),
          ),
          List(
            icon: Icons.logout_outlined,
            text: "Keluar",
            ontap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
