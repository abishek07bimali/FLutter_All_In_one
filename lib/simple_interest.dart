import 'package:all_in_one/homepage.dart';
import 'package:flutter/material.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  State<SimpleInterest> createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  final  principleController= new TextEditingController();
  final  timeController= new TextEditingController();
  final  rateController= new TextEditingController();


  final globalkey =GlobalKey<FormState>();

  double result=10;


  void calculate(){
    double principle =double.parse(principleController.text);
    double time =double.parse(timeController.text);
    double rate=double.parse(rateController.text);

    setState(() {
      result=(principle*time*rate)/100;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest"),
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
              TextFormField(controller: principleController,keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Enter the Principle Amount"),
                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Please enter the number';
                  }
                  else if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),

              TextFormField(controller:timeController,keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Enter the time"),
                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Please enter the number';
                  }
                  else if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),

              TextFormField(controller: rateController,keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Enter the rate"),
                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Please enter the number';
                  }
                  else if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),

              SizedBox(width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        if(globalkey.currentState!.validate()){
                          calculate();
                        }
                      },
                      child: Text("Calculate"))),
              SizedBox(height: 20,),
              Text("Output: $result",style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );

  }
}
