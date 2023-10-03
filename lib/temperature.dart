import 'package:all_in_one/homepage.dart';
import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final  inputTemp= new TextEditingController();
  final globalkey =GlobalKey<FormState>();


  double result=0;

  void calculateFer(){
    double celsius =double.parse(inputTemp.text);
    setState(() {
       result = (celsius * 9 / 5) + 32;    });
  }
  void calculateCel(){
    double fahrenheit =double.parse(inputTemp.text);
    setState(() {
      result = (fahrenheit - 32) * 5 / 9;    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter"),
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: globalkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(controller: inputTemp,keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Enter the Temperature"),
                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Please enter the Temperature';
                  }
                  else if (double.tryParse(value) == null) {
                    return 'Please enter a valid Temperature';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),

              Row(
                children:[ SizedBox(width: 100,
                    child: ElevatedButton(
                        onPressed: (){
                        if(globalkey.currentState!.validate())
                        {
                        calculateCel();
                        }
                        },
                        child: Text("Celsius"))
                ),
                  SizedBox(width: 100,),
                  SizedBox(width: 100,
                      child: ElevatedButton(
                          onPressed: (){
                            if(globalkey.currentState!.validate())
                            {
                              calculateFer();
                            }
                          },
                          child: Text("Fahrenheit"))
                  ),
          ]),

              SizedBox(height: 20,),
              Text("Output: $result",style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );

  }
}
