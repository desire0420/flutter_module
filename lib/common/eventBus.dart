import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class TransEvent{

  String text;

  TransEvent(this.text);
  
}
