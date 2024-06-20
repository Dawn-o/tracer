import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracer/helper/db_helper.dart';
import 'package:tracer/pages/home/today_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DBHelper dbHelper = DBHelper();
  List<Map<String, dynamic>> _expenses = [];

  @override
  void initState() {
    super.initState();
    _refreshExpense();
  }

  void _refreshExpense() async {
    final data = await dbHelper.queryAllExpense();
    setState(() {
      _expenses = data;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Column(
                children: [
                  ..._expenses.map((expense) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xff1D1617).withOpacity(0.07),
                                  offset: const Offset(0, 0),
                                  blurRadius: 40,
                                  spreadRadius: 0)
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat('MMMEd')
                                        .format(expense['date_time'])
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                   Text(
                                    expense['item_price'],
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
                                  surfaceTintColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => TodayDetailPage(),
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
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
