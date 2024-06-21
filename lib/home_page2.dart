import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracer/services/firestore.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  FirestoreService firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getExpensesStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List expensesList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: expensesList.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = expensesList[index];

              String docID = document.id;

              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String item_name = data['item_name'];
              String item_price = data['item_price'];

              return ListTile(
                title: Text(item_name),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
                subtitle: Text(item_price),
              );
            },
          );
        } else {
          return const Text("No Expenses Today...");
        }
      },
    );
  }
}
