import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracer/pages/home/today_detail_page.dart';
import 'package:tracer/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FirestoreService firestoreService = FirestoreService();

    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Expenses",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getExpensesStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List expensesList = snapshot.data!.docs;

                    return Builder(
                      builder: (context) {
                        return Column(
                          children: expensesList.map((document) {
                            String docID = document.id;
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            String item_name = data['item_name'];
                            String item_price = data['item_price'];
                            DateTime purchase_time = data['purchase_time'];
                            return Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: const Color(0xff1D1617)
                                                  .withOpacity(0.07),
                                              offset: const Offset(0, 0),
                                              blurRadius: 40,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                DateFormat('MMMEd')
                                                    .format(purchase_time)
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                item_price,
                                                style: TextStyle(
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ],
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              surfaceTintColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      TodayDetailPage(),
                                                ),
                                              );
                                            },
                                            child: const Icon(
                                              color: Colors.black,
                                              Icons.arrow_forward_ios_rounded,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    );
                  } else {
                    return const Text("No Expenses Today...");
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
