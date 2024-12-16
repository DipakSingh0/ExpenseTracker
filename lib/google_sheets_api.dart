import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  //create credentials
  static const _credentials = r'''
// {
//   "type": "service_account",
//   "project_id": "expensetracker-444916",
//   "private_key_id": "c6f5fa36f005553806c394a6fd6aa7f7ccfb1b8c",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDEXRUpG6Zx/j8W\nUsPSrRaW0uG1g/TS1+wLveYlzlRe9U7vPwzYdjTUAyJDzGZ2SIYXk7ice1QsnzQx\nb6tkh0sQYPgWYb3D0/g6sByp6ysY09ZB0kMWXyHveBBM5ncIKNvE8RAjAcs1nxim\nEntLCxweMv8A0uzu/uN3RKERfJZQl5EXrvmq8Uck+dV62SL+FBRnNe9pJXlWkD7Y\ncn+u8IrTPsdLiRUO0NOiavs1mbqCy17Q8oRu75B1mCBKcKUjkIDAkuB6P9PKo2WM\nK5sRM6RgXLQPJtGyX43u5P9tI5gWFvhyAd7oilI9D1k6g6x76uQZZbjutx2DOZC6\nwk+TYLspAgMBAAECggEADTW5MYmaJ2tetsjnl+SBXgZ0HQrHrWgi3uFYumyzJquN\nsrDvqMo+9eT7aPXhuLhanlBs6B4F2iCgWWkKmISKK2ESn32Az3aS6ZklEdXvvB0C\nz20ZNUfowlw14IPVOHfN3RBd27UIWiRIpgzH6D2oQmx/f4CGZEeXvtN08HZiAwF+\nVLRRYtjEdL/UEY2Vr+Hp58hcYmZlLBHI6pfwnIFSMgNpHKNCBKeEbrfDdWJIbYfO\nzZ0kNrDqCPnbkj3SmQLHLNgpnZg8bxx6vNP7hH2oYME8IKQXewhCCGw3LLmQRpRG\n72fjjn5UyEowF/P9mJeoWPIs7XWdUOe14sqan2GELwKBgQD0jL7bgCkd6s4PoSOk\n9odwRApKBEPDBd9tPc4Qms/1xxbCbWQ0OsM2QzO2S5Tr3J/+7N++mFmjbjVm3cqp\n1X82bSRQMQoo4hvb4Da70HVLLsoDL+ld06cc3EZoZtfFpAP22EuyIAtF0wktLb37\nP2bawa7xlR91ynN8eISIgJf6gwKBgQDNjsL5/hn3kh+SA8SxAz8n3clSfaPUbJCE\nFZgaPSKLd3bktNuIY+/SfOybPSnzbMcRHFAPnq5FaRioyuntZff2jMzTP9JEljyV\nlhUKHcS21DUMVP5KOGhiog4loGqio9LLgIWCPiIgybyZuhoO63sMr18vWL99xLvQ\nUAhLe3yz4wKBgCYrVZrC/SfrPzBXUU3tIKSYKhb1ZXIqF35geCpFT5In+dhs5If2\naAOvJ4Ibd+n8bIiIhj+kXdFRYUpl8bziUtG25UUS8mgBKqH98+0Kk1QhwGwQ7Va0\ns0+g3ehrrN/vQqMjjWUG9Vt3neYMTqvJcI9STbDtOpTS/YV+9gisMYxrAoGAEASm\n9voxJdSyNxuqES0yl7W1wYLe6GfJXzGbl7fZ4Epf7nSVguxevOVVPsemZDy+ynuN\nVZpE9E27STP+xKwkhYb1UyTvCr82W2XFn/Mv6BtjQuHAqyH4KG9+cLoudRwVChyq\nyrpyyGFQHB6fdzgsb5Ge9j6RNYjGJfaGnvMxhYcCgYBuPcnSsLO9nwMGhiVFPAJC\nlXewgiR503tZOkQzz3rZT/W/Qm4xhl3b4zR6I9LiQi76NoK5rCYRqGYfswlFCGgf\n1N1JIDpUiGB7pONWXxqOELa80cywnF0Ea1SiNtdEfFkvGcwjDSUq0iAluQiL9/yE\n028eqF6ATx36fv8jg9cj+Q==\n-----END PRIVATE KEY-----\n",
//   "client_email": "flutter-expense-tracker@expensetracker-444916.iam.gserviceaccount.com",
//   "client_id": "113576575810659415896",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-expense-tracker%40expensetracker-444916.iam.gserviceaccount.com",
//   "universe_domain": "googleapis.com"
// }

  ''';
  //set up and connect to the spreadsheet

  static final _spreadsheetId = ''; // 18lWKnVJy818wFME2IKwdkQzqepLcRZ6Wn3J6jk_VqHc
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  //some variables to keep track off
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;
  
  get values => null;

  //initialise the spreadsheet
  // Future init() async {
  //   final ss = await _gsheets.spreadsheet(_spreadsheetId);
  //   _worksheet = ss.worksheetByTitle('Sheet1');
  //   countRows();
  // }

   // Check if the sheet is connected and print the result to the terminal
 // Make testConnection a static method
  // static Future<void> testConnection() async {
  //   if (_worksheet == null) {
  //     print('Sheet is NOT connected.');
  //   } else {
  //     print('Sheet is connected.');
  //   }
  // }

  Future init() async {
    try {
      final ss = await _gsheets.spreadsheet(_spreadsheetId);
      _worksheet = ss.worksheetByTitle('Workshet1');

      // If _worksheet is null, it indicates an issue with fetching the worksheet.
      if (_worksheet == null) {
        print('Failed to fetch the worksheet. Please check the title.');
      } else {
        print('Worksheet fetched successfully.');
        await countRows(); // You may want to call countRows here instead of later
      }
    } catch (e) {
      print('Error initializing Google Sheets: $e');
    }
  }

static Future<void> testConnection() async {
    if (_worksheet == null) {
      print('Sheet is NOT connected.');
    } else {
      print('Sheet is connected.');
      // Optionally, you can also fetch some data to confirm the connection
      final firstRow = await _worksheet!.values.row(1);
      print("First row: $firstRow"); // Debug output
    }
  }


    // Reconnect if the worksheet is null
  Future<void> reconnect() async {
    if (_worksheet == null) {
      print('Reconnecting to Google Sheets...');
      await init();
    }
  }

  // count the number of notes
  static Future countRows() async {
    while ((await _worksheet!.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    // now we know how many notes to load, now let's load them!
    loadTransactions();
  }

  
  // load existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    // print(currentTransactions);
    // this will stop the circular loading indicator
    loading = false;
  }


  //insert a new ntote
  static Future insert(String name, String amount, bool _isIncome) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
  }

  //calcultte the total income
  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'income') {
        totalIncome += double.parse(currentTransactions[i][1]);
      }
    }
    return totalIncome;
  }

  
  //calcultte the total Expense
  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'expense') {
        totalExpense += double.parse(currentTransactions[i][1]);
      }
    }
    return totalExpense;
  }

// delete the expense
// Method to delete a transaction
// static Future<void> deleteTransaction(int index) async {
//   if (_worksheet == null || index < 0 || index >= currentTransactions.length) {
//     print('Invalid index or worksheet not connected.');
//     return;
//   }

//   // Remove the transaction from the currentTransactions list
//   currentTransactions.removeAt(index);
//   numberOfTransactions--;

//   // Update the Google Sheets worksheet
//   // Clear the entire worksheet first (optional, depending on your use case)
//   await _worksheet!.clear(); // Assuming this is the correct method to clear the worksheet

//   // Reinsert all transactions back into the worksheet
//   for (int i = 0; i < currentTransactions.length; i++) {
//     await _worksheet!.appendRow(currentTransactions[i]); // Assuming this is the correct method to append a row
//   }

//   print('Transaction at index $index deleted successfully.');
// }

// // Extension to handle worksheet operations
//   Future<void> clear() async {
//     // Implement the logic to clear the worksheet
//     await this.values.clear(); 
//   }

//   Future<void> appendRow(List<dynamic> row) async {
//     // Implement the logic to append a row to the worksheet
//     await this.values.appendRow(row); 
//   }
// }

// extension on Worksheet {
//   appendRow(List currentTransaction) {}
// }
}