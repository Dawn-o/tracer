import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tracer/pages/form.dart';
import 'package:tracer/services/firestore.dart';

class TodayDetailPage extends StatefulWidget {
  const TodayDetailPage(
      {super.key,
      required this.docID,
      required this.itemName,
      required this.itemPrice,
      required this.date});
  final docID;
  final itemName;
  final itemPrice;
  final date;

  @override
  State<TodayDetailPage> createState() => _TodayDetailPageState();
}

class _TodayDetailPageState extends State<TodayDetailPage> {
  final FirestoreService firestoreService = FirestoreService();
  // String itemName = '';
  // String itemPrice = '';
  // String date = '';
  // void initState() {
  //   super.initState();
  //   getDocumentById(widget.docID);
  // }

  // void getDocumentById(String docID) async {
  //   DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //       .collection('expenses')
  //       .doc(docID)
  //       .get();

  //   setState(() {
  //     itemName = documentSnapshot['item_name'];
  //     itemPrice = NumberFormat("#,##0", "en_US").format(int.parse(documentSnapshot['item_price'])).toString();
  //     date = DateFormat('jm').format((documentSnapshot['timestamp'] as Timestamp).toDate());
  //   });
  // }

  @override
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
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        height: 340,
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xff1D1617).withOpacity(0.07),
                  offset: const Offset(0, 0),
                  blurRadius: 40,
                  spreadRadius: 0)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.date,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(color: Colors.black, thickness: 1),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Item Name:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                widget.itemName,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 6),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Item Price:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Rp. ${widget.itemPrice}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      bool _shouldRefresh = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => FormPage(docID: widget.docID),
                        ),
                      );

                      if (_shouldRefresh == true) {
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.mode_edit_sharp,
                      size: 30,
                      color: Colors.blue[800],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Implement delete functionality
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
