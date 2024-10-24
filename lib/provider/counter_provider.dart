import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier{
  //changeNotifier is kind of a setState of the provider package
  int _count = 0;
  int get count {
    return _count;
  }

  void increment(){
    _count++;
    //notifyListeners is a method which notifies to class above to update the state wherever the class isbeing called
    notifyListeners();
  }

  void decrement(){
     _count--;
     notifyListeners();
  }

  String _name = 'Bolu';
    
  String get name => _name;

void updateName(){
    _name = 'Melody';
    notifyListeners();
  }
}


