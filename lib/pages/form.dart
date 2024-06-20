import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracer/helper/db_helper.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final DBHelper dbHelper = DBHelper();
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();
  var dateTimeController = DateTime.now();

  Future<void> _addExpense() async {
    await dbHelper.insertExpense({
      'item_name': _itemNameController.text,
      'item_price': _itemPriceController.text,
      'date_time': dateTimeController,
    });
    Navigator.of(context).pop();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Expenses Added')));
  }

  Future<void> _updateExpense(int id) async {
    await dbHelper.updateExpense({
      'id': id,
      'item_name': _itemNameController.text,
      'item_price': _itemPriceController.text,
    });
    Navigator.of(context).pop(true);
    Navigator.of(context).pop(true);

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Expenses Edited')));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xfFAAD7D9),
        title: const Text(
          "TRACER",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Libre Baskerville',
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add Your Today's Expenses",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Item Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                            color: Color(0xffE71010),
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _itemNameController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Color(0xffD5D8DE))),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Item Name!";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Item Price",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                            color: Color(0xffE71010),
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _itemPriceController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Color(0xffD5D8DE))),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Item Price!";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    elevation: 0,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: const Color(0xff92C7CF),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
