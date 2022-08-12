import 'package:flutter/foundation.dart';
class FavouriteProvider with ChangeNotifier{
  List<int> _selecteditem=[];
  List<int> get selecteditems=>_selecteditem;
  void addItem(int value)
  {
    _selecteditem.add(value);
    notifyListeners();
  }
  void removeItem(int value)
  {
    _selecteditem.remove(value);
    notifyListeners();
  }
}