import 'package:flutter/material.dart';
import 'package:furni_order/views/homePage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telepon = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _registerProccess() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(height: 5),

              // App Title
              const Text(
                'Furni Order',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic
                ),
              ),
              const SizedBox(height: 20),

              // Welcome
              const Text(
                'Registrasi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle
              const Text(
                'Silahkan isi semua data dibawah ini untuk membuat akun',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Nama
              TextFormField(
                controller: _nama,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  hintText: 'Masukan nama...',
                  border: OutlineInputBorder(),
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
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
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
                    _registerProccess();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
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