import 'package:flutter/material.dart';

class TopNeuCard extends StatelessWidget {
  final String balance;
  final String income;
  final String expense;

  TopNeuCard(
      {required this.balance, required this.income, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('B A L A N C E',
                      style: TextStyle(color: Colors.grey[600], fontSize: 26)),
                  Text('Rs. $balance',
                      style: TextStyle(color: Colors.grey[800], fontSize: 40)),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_circle_up_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                            Column(
                              children: [
                                Text('Income'),
                                Row(
                                  children: [
                                    Text('Rs.'),
                                    Text(income),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_circle_down_outlined,
                              color: Colors.red,
                              size: 50,
                            ),
                            Column(
                              children: [
                                Text('Expense'),
                                Row(
                                  children: [
                                    Text('Rs.'),
                                    Text(expense),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
