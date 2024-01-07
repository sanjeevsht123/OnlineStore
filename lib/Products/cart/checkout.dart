import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController v_id=TextEditingController();
  TextEditingController expirey=TextEditingController();
  TextEditingController vcc=TextEditingController();
  int currentIndex=0;
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
        centerTitle: true,
      ),
      body: Stepper(
        steps: [
          Step(
            title: Text("Checkout Info"), 
            content: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text("Name"),
                  ),
                ),
                TextFormField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text("Phone")
                  ),
                ),
                TextFormField(
                  controller: address,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text("Address")
                  ),
                ),
              ],
            )),

            Step(
              title: Text("Billing Info"), 
              content: Column(
              children: [
                TextFormField(
                  controller: v_id,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text("Visa Card Number"),
                  ),
                ),
                TextFormField(
                  controller: expirey,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text("Expirey Date")
                  ),
                ),
                TextFormField(
                  controller: vcc,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text("VCC")
                  ),
                ),
              ],
            )),
            Step(
              title: Text("Confirmation"), 
              content: Column(
                children: [
                  Text("Name: ${name.text}"),
                  SizedBox(height: 10,),
                   Text("Phone: ${phone.text}"),
                  SizedBox(height: 10,),
                   Text("Address: ${address.text}"),
                  SizedBox(height: 10,),
                   Text("Visa card no.: ${v_id.text}"),
                  SizedBox(height: 10,),
                   Text("Expirey Date: ${expirey.text}"),
                  SizedBox(height: 10,),

                   Text("VCC: ${vcc.text}"),
                  SizedBox(height: 10,),

                ],
              ))
        ],
        currentStep: currentIndex,
        onStepCancel: (){
          if(currentIndex<0){
            currentIndex--;
          }
        },
        onStepContinue: (){
          if(currentIndex>2){
            currentIndex++;
          }
        },
        onStepTapped: (index){
          setState(() {
          currentIndex=index;
          print(currentIndex);
          });
          
        },
        
        ),
    );
  }
}