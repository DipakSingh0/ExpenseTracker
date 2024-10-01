import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  //create credentials
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "flutter-437220",
  "private_key_id": "a2f6f4950309afa8a9be2257a0e7ff8801d3a86f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDVpNWRadeoLqxr\nLFmYyF6Yxxut8laYO1247/s1aB3sUpmmWzpiM7HrSDkG5fWzlF1FF16lcvnvQnwf\nKiQMqs5SwMQ7twgtFreGy4xDaOivaJs8Xb51m12fNUnA0sJywVjSlq+WKCW12WU6\nnqTsDo2Cg/fIvUknDBGZPdBWv9C6dN1eGwnkOBGsy6VPSHVLtuoM/pYdXCAW9646\nPf4mrnec14x1fsIrhhR97HlOiqT2T0m7SAIg9A/RUMb0UwDSVgZNfDucz3CAUobD\n/jVKPLt+N1DlffypXSqdcv4cD6gmbUUuxoYIjfq8GzkXYF2YSHWvecZcROka/h6K\nxjBwouh5AgMBAAECgf8jzu7UYzhOKaFwnApM6qOyJUf7JBfyVC8+7KZaAmLb9PrS\nXXdXyBZVq0ZdI8xkHmYKJvMKZnSES6aYm0yNKzOf/lH7Y5+9Xk3Bxs2h+EqfrHnK\nrAFoZhERlqwYBiWXyPgoWZrBVUPNFtapZGC6WIqyjYgnoqIvCLdbOK5Ltlq8wsGH\n3BWR1lCWLM8UG/B5i4qr6zwO23kl+rjpufxUvGrCKxa7IlD2sUJ33mPSx+2lNtvv\n/M3XeGjInBMb1/UagpdHC+EQmBp06t9iJtLHPkcZOJa0xxZ/hl5QV6AnMI3WOyzC\nNdHLvuNYfYsLrOP1An2eiHkxgZhuwiLX3alSrwECgYEA7AMI/NzPhXEPf78i0AuP\njaONE7VkF/NbxNTfJXYUA/8WT+TwJ6PL09o32UpW5yfNd5OtplmUWHtKxQQiN4b3\nr12FFhQlQQ9hixPuLzmZgJ8FW5W9Z2FrLwBelP7YLn4mFYxrmaDwp5vlZVAoC84r\n+fRkyvCQfBgNaaVxQ/uaYvkCgYEA57zXBHEjJHBuDf0StGG5//dCMBHr4QnLLsr9\n/F8kJmziQz2/gmTsXcxxMDNIdivNJ9XiTHvB0wc8qKIZDIToLji86uBjPSsge/Yh\ncn18caNhS7mmQYpvRxPuTaLslqokHHTjCjus9oabBfKYfT2S0DUYju4hiGr/63o5\nC44IkYECgYBUslYkYJ28lrFoN9Cndq6ituHnA76S9cumHHqkN/bA5Gc+brtcjmSU\nd4h5WztKozcSRZYYz6b0BfL0NyKMaMw0S8x5+urPqVRpE9LzcalLxkWm81rQYd6U\nNH6826P7M1w5eXYX4PDcRY8SR6zHZ8rSXclaJvDDB+KwWiYGrqFeCQKBgQCadIoX\notTad7lSx4fNBIn1ajcKVReTsXRkZtXsfPlaRx5z1NctMNk+F4KlrriwUrd1wqAH\nfEEOx3cNqqTpbDhYfmakYhSi83i+Rqm6ZpsoHs49q6p9aqiKhmVCB8KLFTHmaZ3d\n9zJsSgFPcIdkikKtVYZd1agyBac3qwoUgoGBgQKBgQDTFflEq0yTLRsB0fymLO0W\nd338fh465SqN2I3ihLxRvfiaf0QTVu+Fjv4kNG+3Wd5WL2w3XfegiabDR1hg5SmQ\nPpzWDkun7cTo/HM/erKz+dDFhP83uof2gaTI+uPpaN7KRQLSfFb9jw17nbubn9Ul\nXka1U7VNywTl7AJlr5/9ww==\n-----END PRIVATE KEY-----\n",
  "client_email": "flutterghseet@flutter-437220.iam.gserviceaccount.com",
  "client_id": "106797673302725442975",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutterghseet%40flutter-437220.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
  ''';
  //set up and connect to the spreadsheet

  static final _spreadsheetId = '18lWKnVJy818wFME2IKwdkQzqepLcRZ6Wn3J6jk_VqHc';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  //some variables to keep track off
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

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

}