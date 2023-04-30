import 'package:flutter/material.dart';
import 'reg_page.dart';
//Program for registration form

class FormOfRegistration extends StatefulWidget {
  const FormOfRegistration({super.key});

  @override
  State<FormOfRegistration> createState() => _FormOfRegistrationState();
}

class _FormOfRegistrationState extends State<FormOfRegistration> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registration(),
    );
  }
}
