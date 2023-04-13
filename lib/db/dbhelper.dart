import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/models/itemModel.dart';

class Dbhelper{
  static final _db=FirebaseFirestore.instance;

  static Future<void> addItem(ItemModel items) {
    final doc =_db.collection(collectionItem).doc();
    items.id=doc.id;
    return doc.set(items.toMap());
  }
  static Stream<QuerySnapshot<Map<String,dynamic>>>getAllitem()=>
      _db.collection(collectionItem).snapshots();

  Future<void> updateProductField(String itemid, Map<String, dynamic> map) {
    return _db.collection(collectionItem).doc(itemid).update(map);
  }

  static Future<void> deleteItem(String id) async{

    return _db.collection(collectionItem).doc(id).delete();
  }
}

