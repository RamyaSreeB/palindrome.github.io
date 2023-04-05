import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palindrome Checker',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Palindrome Checker'),
        ),
        body: PalindromeChecker(),
      ),
    );
  }
}

class PalindromeChecker extends StatefulWidget {
  @override
  _PalindromeCheckerState createState() => _PalindromeCheckerState();
}

class _PalindromeCheckerState extends State<PalindromeChecker> {
  final TextEditingController _controller = TextEditingController();

  bool _isPalindrome = false;

  void _checkPalindrome(String input) {
    String reversed = String.fromCharCodes(input.runes.toList().reversed);
    setState(() {
      _isPalindrome = input == reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter a word or phrase',
            ),
            textAlign: TextAlign.center,
            onChanged: _checkPalindrome,
          ),
          SizedBox(height: 16.0),
          Text(
            _isPalindrome ? 'It is a palindrome!' : 'Not a palindrome',
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
