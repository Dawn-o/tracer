import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // GET COLLECTION
  final CollectionReference expenses =
      FirebaseFirestore.instance.collection('expenses');

  // ADD FUNCTION
  Future<void> AddExpense(String item_name, item_price) {
    return expenses.add({
      'item_name': item_name,
      'item_price': item_price,
      'purchase_time': DateTime.now(),
    });
  }

  // READ : get Expenses data from database
  Stream<QuerySnapshot> getExpensesStream() {
    final expensesStream =
        expenses.orderBy('purchase_time', descending: true).snapshots();

    return expensesStream;
  }

  Future<void> updateExpense(String docID, String newName, newPrice) {
    return expenses.doc(docID).update({
      'item_name': newName,
      'item_price': newPrice,
    });
  }

  Future<void> deleteExpense(String docID) {
    return expenses.doc(docID).delete();
  }
}
