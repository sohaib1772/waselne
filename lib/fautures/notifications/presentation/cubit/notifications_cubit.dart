import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/fautures/notifications/data/notifications_channle.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_states.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NotificationsCubit extends Cubit<NotificationsStates>{
  NotificationsCubit(this.channel) : super(NotificationsInitial());

  final NotificationsChannle channel;

  void connectNotifications()async{
    channel.channel.stream.listen((event) {
      print("eveeeeeeeeent $event");
      getNotifications();
    });
  }
  void getNotifications(){
    
    emit(NotificationsCount(10));
  }
}