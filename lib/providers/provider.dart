import 'package:carousel_slider/carousel_controller.dart';
import 'package:dummy/data/model/event.dart';
import 'package:dummy/data/repository/event_repo.dart';
import 'package:flutter/material.dart';
// import '../models/event.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class EventProvider extends ChangeNotifier {
 EventRepo eventRepo = EventRepo();
  int _selectedTickets = 1;
  int _currentIndex = 0;
  bool _isLoading = true;
  final CarouselController _controller = CarouselController();
  late Event _eventList;

  bool get isLoading => _isLoading;
  int get currentIndex => _currentIndex;
  CarouselController get controller => _controller;
  int get selectedTickets => _selectedTickets;
  Event get eventList => _eventList;



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
  
    
  void updateIndex(index) {
     _currentIndex = index;
    notifyListeners();
  }


  void getEvents(){
      _eventList = Event.fromJson(eventRepo.events);
      _isLoading =  false;
      notifyListeners();
  }
}