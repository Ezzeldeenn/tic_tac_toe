import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'bord.dart';

class tictacprov with ChangeNotifier{
String first='';
String second='';

void Reset(){
first=" ";
second=" ";
notifyListeners();
}

}