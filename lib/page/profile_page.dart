import 'package:flutter/material.dart';
import 'package:furni_order/page/auth/login_page.dart';
import 'package:furni_order/page/widget/dialog_success.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nama = TextEditingController(text: 'Ahmad Dimyati');
  final TextEditingController _email = TextEditingController(text: 'dimyati336@gmail.com');
  final TextEditingController _telepon = TextEditingController(text: '0895617614604');
  final TextEditingController _alamat = TextEditingController(text: 'Kp. Mahmud, Desa mekarrahayu, Kecamatan margaasih, Kab bandung');
  final TextEditingController _username = TextEditingController(text: 'ahdim');
  final TextEditingController _password = TextEditingController();

  void _updateProccess() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DialogSuccess(title: 'BERHASIL', description: 'Profile berhasil diperbaharui');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'Furni Order',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }, 
            icon: const Icon(Icons.logout_rounded, color: Colors.white)
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Logo
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
              const SizedBox(height: 5),

              // App Title
              const Text(
                'Ahmad Dimyati',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                )
              ),
              const SizedBox(height: 10),

              // Subtitle
              const Text(
                'Teknik Informatika at UNIBI',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Nama
              TextFormField(
                controller: _nama,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  hintText: 'Masukan nama...',
                  border: OutlineInputBorder(),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Email
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukan email...',
                  border: OutlineInputBorder(),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Telepon
              TextFormField(
                controller: _telepon,
                decoration: const InputDecoration(
                  labelText: 'Telepon',
                  hintText: 'Masukan telepon...',
                  border: OutlineInputBorder(),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'telepon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Alamat
              TextFormField(
                controller: _alamat,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'Masukan alamat...',
                  border: OutlineInputBorder(),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Username
              TextFormField(
                controller: _username,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukan username...',
                  border: OutlineInputBorder(),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'username tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Password
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukan Password...',
                  border: OutlineInputBorder(),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)
                  ),
                )
              ),
              const SizedBox(height: 10),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () {
                    _updateProccess();
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}