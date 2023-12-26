import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'platform_utils.dart'; // Import the platform-specific utility



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Encryption/Decryption',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.shamma.sample/app');


  String encryptedString = "";
  String decryptedString = "";
  String textToEncrypt = "";
  String textToDecrypt = "";
  String keyForEncryption = "";
  String keyForDecryption = "";
  String ivForEncryption = "";
  String ivForDecryption = "";


  void encryptString() async {
    try {
      final String result = await platformencryptString(textToEncrypt, keyForEncryption, ivForEncryption);
      setState(() {
        encryptedString = result;
      });
    } catch (e) {
      setState(() {
        encryptedString = "Failed to encrypt: ${e.toString()}";
      });
    }
  }

  void decryptString() async {
    try {
      final String result = await platformdecryptString(textToDecrypt, keyForDecryption, ivForDecryption);
      setState(() {
        decryptedString = result;
      });
    } catch (e) {
      setState(() {
        decryptedString = "Failed to decrypt: ${e.toString()}";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Encryption/Decryption'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              buildTextField('Text to Encrypt', (value) => textToEncrypt = value),
              buildTextField('Encryption Key', (value) => keyForEncryption = value),
              buildTextField('Encryption IV', (value) => ivForEncryption = value),
              buildButton('Encrypt', encryptString, encryptedString),


              SizedBox(height: 40),


              buildTextField('Text to Decrypt', (value) => textToDecrypt = value),
              buildTextField('Decryption Key', (value) => keyForDecryption = value),
              buildTextField('Decryption IV', (value) => ivForDecryption = value),
              buildButton('Decrypt', decryptString, decryptedString),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildTextField(String label, Function(String) onChanged) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label),
    );
  }


  Widget buildButton(String text, VoidCallback onPressed, String result) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
        SizedBox(height: 10),
        Text(result, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
