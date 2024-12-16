// import 'package:flutter/material.dart';

// class TransactionList extends StatelessWidget {
//   final List<List<dynamic>> transactions; // List of transactions
//   final Function(int) onDelete; // Callback function to delete a transaction

//   TransactionList({required this.transactions, required this.onDelete});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: transactions.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onLongPress: () {
//             _showDeleteConfirmationDialog(context, index);
//           },
//           child: ListTile(
//             title: Text(transactions[index][0]), // Transaction name
//             subtitle: Text(transactions[index][1]), // Transaction amount
//             trailing: Text(transactions[index][2]), // Transaction type
//           ),
//         );
//       },
//     );
//   }

//   void _showDeleteConfirmationDialog(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Delete Transaction'),
//           content: Text('Are you sure you want to delete this transaction?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 onDelete(index); // Call the delete function
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Delete'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }