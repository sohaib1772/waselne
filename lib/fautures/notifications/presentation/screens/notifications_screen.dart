import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_states.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: BlocListener<NotificationsCubit,NotificationsStates>(listener: (context, state) {
        
      },child: BlocBuilder<NotificationsCubit,NotificationsStates>(builder: (context, state) {
        return Container();
      },),),
    );
  }
}