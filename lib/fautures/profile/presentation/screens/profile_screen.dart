import 'package:flutter/material.dart';
import 'package:waselne/fautures/profile/presentation/widgets/profile_buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ProfileButtons(),
    ],);
  }
}