import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}