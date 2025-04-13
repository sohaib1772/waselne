import 'package:flutter/material.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';

class AppLoadingScreen extends StatefulWidget {
  const AppLoadingScreen({super.key});

  @override
  State<AppLoadingScreen> createState() => _AppLoadingScreenState();
}

class _AppLoadingScreenState extends State<AppLoadingScreen> {

  Future<void> delay ()async{
await Future.delayed(const Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: delay(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            AppRouter.routes.pop();
          }
          return const Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}