import 'package:flutter/material.dart';
import 'package:patient/extensions/loc_ext.dart';

class PatientSignUpPage extends StatelessWidget {
  const PatientSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.loc.signup),
      ),
    );
  }
}
