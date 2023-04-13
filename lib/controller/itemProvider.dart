import 'package:flutter/cupertino.dart';
import 'package:testapp/db/dbhelper.dart';
import 'package:testapp/models/itemModel.dart';

class ItemProvider extends ChangeNotifier{
  List<ItemModel> items=[];
  Future<void> addItem(ItemModel items) {
    return Dbhelper.addItem(items);
  }
  static Future<void>updateProductField(String itemid,String filed,dynamic value){
    return Dbhelper().updateProductField(itemid, {filed:value});
  }
  getAllitem(){
    Dbhelper.getAllitem().listen((snapshot) {
      items=List.generate(snapshot.docs.length, (index) => ItemModel.fromMap(snapshot.docs[index].data()));

      notifyListeners();
    });
  }
  static Future<void> deleteItem(String id) async {
    return  Dbhelper.deleteItem(id);
  }
}