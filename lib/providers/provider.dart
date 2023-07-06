import 'package:flutter/material.dart';
// import '../models/event.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class EventProvider extends ChangeNotifier {
  int _selectedTickets = 1;

  int get selectedTickets => _selectedTickets;

  void incrementTicket() {
    _selectedTickets++;
    notifyListeners();
  }

  void decrementTicket() {
    if(_selectedTickets > 1){
          _selectedTickets--;
    }
    notifyListeners();
  }

}