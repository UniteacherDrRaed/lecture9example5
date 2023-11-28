import 'package:flutter/cupertino.dart';

import '../model/laptop.dart';

class ListOfLaptops extends ChangeNotifier{

  List<Laptop> laptops=List.generate(10,
          (index) => Laptop(name: "name $index",
              model: "model $index",
              poblemDescription: "poblemDescription $index"));
  List<Laptop> repairedLaptops=[];
  void addtorepairedLaptops(Laptop laptop){
    repairedLaptops.add(laptop);
    notifyListeners();
  }
  void removeFromrepairedLaptops(Laptop laptop){
    repairedLaptops.remove(laptop);
    notifyListeners();
  }

}
