import 'package:flutter/material.dart';
import 'package:furni_order/views/auth/loginPage.dart';
import 'package:furni_order/views/homePage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telepon = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height
          ),
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

              const SizedBox(height: 5,),

              // App Title
              const Text(
                'Furni Order',
                style: TextStyle(
                  fontSize: 12
                ),
              ),

              const SizedBox(height: 50,),

              // Welcome
              const Text(
                'Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
              ),

              const SizedBox(height: 10,),

              // Subtitle
              const Text(
                'Silahkan daftarkan data anda disini',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20,),

              // Nama
              TextFormField(
                controller: _nama,
                decoration: const InputDecoration(
                  hintText: 'Nama'
                ),
              ),

              // Email
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  hintText: 'Email'
                ),
              ),

              // Telepon
              TextFormField(
                controller: _telepon,
                decoration: const InputDecoration(
                  hintText: 'Telepon'
                ),
              ),

              // Alamat
              TextFormField(
                controller: _alamat,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Alamat Lengkap',
                ),
              ),

              // Username
              TextFormField(
                controller: _username,
                decoration: const InputDecoration(
                  hintText: 'Username'
                ),
              ),

              // Password
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password'
                ),
              ),

              const SizedBox(height: 10,),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)
                  ),
                  onPressed: () {}, 
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}