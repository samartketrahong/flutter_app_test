
import 'package:flutter/foundation.dart';

class Transaction with ChangeNotifier {
  List<Cat> cat = [
    // Cat(name: 'แมวมาเลศ', tail:'แมวโคราช'),
    // Cat(name: 'แมววิเชียรมาศ', tail:'แมวแก้ว'),
  ];

  addCat(Cat data){
    cat.add(data);
    // insert (0,data)
    notifyListeners();
  }
}

class Cat {
  final String name;
  final String tail;
  final int age;

  Cat( {this.name, this.tail,this.age,});
}