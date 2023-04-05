import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palindrome Checker',
      home: PalindromeChecker(),
    );
  }
}

class PalindromeChecker extends StatefulWidget {
  @override
  _PalindromeCheckerState createState() => _PalindromeCheckerState();
}

class _PalindromeCheckerState extends State<PalindromeChecker> {
  TextEditingController textEditingController = TextEditingController();
  String message = '';

  bool isPalindrome(String str) {
    int i = 0;
    int j = str.length - 1;
    while (i < j) {
      if (str[i] != str[j]) {
        return false;
      }
      i++;
      j--;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palindrome Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter a string',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String str = textEditingController.text;
                  bool palindrome = isPalindrome(str);
                  if (palindrome) {
                    message = '$str is a palindrome!';
                  } else {
                    message = '$str is not a palindrome!';
                  }
                });
              },
              child: Text('Check'),
            ),
            SizedBox(height: 16.0),
            Text(
              message,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
