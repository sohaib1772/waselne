sealed class NotificationsStates {}

class NotificationsInitial extends NotificationsStates {}

class NotificationsConnected extends NotificationsStates {}

class NotificationsDisconnected extends NotificationsStates {}
class NotificationsCount extends NotificationsStates {
  int count;
  NotificationsCount(this.count);
}



class NotificationsError extends NotificationsStates {}