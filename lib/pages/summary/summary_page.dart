import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Expenses This Month",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff1D1617).withOpacity(0.08),
                              offset: const Offset(0, 0),
                              blurRadius: 40,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Week 1',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Rp. 25.000",
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
                            onPressed: () {},
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
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff1D1617).withOpacity(0.08),
                              offset: const Offset(0, 0),
                              blurRadius: 40,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Week 2',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Rp. 25.000",
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
                            onPressed: () {},
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
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff1D1617).withOpacity(0.08),
                              offset: const Offset(0, 0),
                              blurRadius: 40,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Week 3',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Rp. 0",
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
                            onPressed: () {},
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
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff1D1617).withOpacity(0.08),
                              offset: const Offset(0, 0),
                              blurRadius: 40,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Week 4',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Rp. 0",
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
                            onPressed: () {},
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
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: const Color(0xff1D1617).withOpacity(0.08),
                    offset: const Offset(0, 0),
                    blurRadius: 40,
                    spreadRadius: 0)
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Expenditure : ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Rp. 50.000",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
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
