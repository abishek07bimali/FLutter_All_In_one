import 'package:all_in_one/homepage.dart';
import 'package:flutter/material.dart';

class ReverseString extends StatefulWidget {
  const ReverseString({super.key});

  @override
  State<ReverseString> createState() => _ReverseStringState();
}

class _ReverseStringState extends State<ReverseString> {
  final  StringController= new TextEditingController();

  final globalkey =GlobalKey<FormState>();

  String result="";

  bool isAllLetters(String str) {
    final letterRegex = RegExp(r'^[a-zA-Z]+$');
    return letterRegex.hasMatch(str);
  }

  void reverseAndPrintString() {
    String input =StringController.text;

    List<String> characters = input.split('');
    List<String> reversedCharacters = characters.reversed.toList();
    String reversedString = reversedCharacters.join('');
    setState(() {
      result = reversedString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse a String"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                controller: StringController,
              keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Enter the String to be Reversed"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    if (!isAllLetters(value)) {
                      return 'Please enter a string with no numbers';
                    }
                    return null;
                  },

                ),
                SizedBox(height: 20,),
                SizedBox(width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if(globalkey.currentState!.validate())
                      {
                        reverseAndPrintString();
                      }
                      },
                  child: Text("Reverse"))),
                SizedBox(height: 20,),
                Text("Result: $result",style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),
      ),
    );

  }
}



