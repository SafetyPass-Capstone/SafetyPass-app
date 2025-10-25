import 'package:flutter/foundation.dart';
import 'package:safetypass_app/models/event_models.dart';

class EventStore extends ChangeNotifier {
  Venue? _venue;
  TicketInfo? _ticket;

  Venue? get venue => _venue;
  TicketInfo? get ticket => _ticket;

  void setVenue(Venue v) { _venue = v; notifyListeners(); }
  void setTicket(TicketInfo t) { _ticket = t; notifyListeners(); }
  void clearTicket() { _ticket = null; notifyListeners(); }
}
