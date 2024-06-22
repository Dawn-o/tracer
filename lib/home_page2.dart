import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracer/pages/form.dart';
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

          return Builder(
            builder: (context) {
              return Column(
                children: expensesList.map((document) {
                  String docID = document.id;
                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  String item_name = data['item_name'];
                  String item_price = data['item_price'];

                  return ListTile(
                    title: Text(item_name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => FormPage(docID: docID),
                              ),
                            );
                          },
                          icon: const Icon(Icons.settings),
                        ),
                        IconButton(
                          onPressed: () {
                            firestoreService.deleteExpense(docID);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    subtitle: Text(item_price),
                  );
                }).toList(),
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
