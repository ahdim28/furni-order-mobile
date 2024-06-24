import 'package:flutter/material.dart';
import 'package:furni_order/views/auth/registerPage.dart';
import 'package:furni_order/views/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _loginProccess() {
    final String username = _username.text;
    final String password = _password.text;

    if (username == 'ahdim' && password == 'ahdim123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username / Password salah, silahkan coba lagi')),
      );
    }
  }

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
                'Selamat Datang',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
              ),

              const SizedBox(height: 10,),

              // Subtitle
              const Text(
                'Silahkan login dengan akun anda untuk\nmasuk ke aplikasi',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20,),

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
                  onPressed: () {
                    _loginProccess();
                  }, 
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ),
              ),

              const SizedBox(height: 10,),

              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    'Belum memiliki akun? silahkan daftar disini',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}