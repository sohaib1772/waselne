import 'package:flutter/material.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },child: Icon(Icons.add),),
      body: SafeArea(
        child: Center(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FilledButton.icon(onPressed: () {
                
              }, icon: Icon(Icons.abc),label: Text("data"),),
              TextFormField(),
            ],
          ),
        ),),
      ),
    );
  }
}