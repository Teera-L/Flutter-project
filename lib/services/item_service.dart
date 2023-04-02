import 'package:cloud_firestore/cloud_firestore.dart';

class ItemService {
  Future<void> addItem(String documentid, Map<String, String> data) {
    return FirebaseFirestore.instance
        .collection("items")
        .add(data)
        .then((value) {
      print("Item created");
    }).catchError((error) {
      print("Can't create item:" + error.toString());
    });
  }

  Future<void> editItem(String documentid, Map<String, String> data) {
    return FirebaseFirestore.instance
        .collection("items")
        .doc(documentid)
        .update(data)
        .then((value) {
      print("Item update");
    }).catchError((error) {
      print("Can't update item:" + error.toString());
    });
  }

  Future<void> updateItem(String documentId, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection("items")
        .doc(documentId)
        .update(data);
  }

  Future<void> deleteItem(String documentid) {
    return FirebaseFirestore.instance
        .collection("items")
        .doc(documentid)
        .delete()
        .then((value) {
      print("Item deleted");
    }).catchError((error) {
      print("Can't delete item:" + error.toString());
    });
  }
}
