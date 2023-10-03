import 'package:all_in_one/homepage.dart';
import 'package:flutter/material.dart';

class AreaOfCircle extends StatefulWidget {
  const AreaOfCircle({super.key});

  @override
  State<AreaOfCircle> createState() => _AreaOfCircleState();
}

class _AreaOfCircleState extends State<AreaOfCircle> {
  final  radiusController= new TextEditingController();

  final globalkey =GlobalKey<FormState>();
  double result=0;

  void calculate(){
    double radius =double.parse(radiusController.text);
    setState(() {
      result=(22/7)*(radius*radius);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Area of circle"),
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
                controller: radiusController,
              keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Enter the radius of circle"),
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
                    if(globalkey.currentState!.validate())
                      {
                        calculate();
                      }
                      },
                  child: Text("Calculate"))),
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



