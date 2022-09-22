import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var _input = '';

 Widget _buildIndicator(bool on){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.deepPurple.shade800,
            width: 1.0,
          ),
          color: on ?Colors.deepPurple.shade400 : Colors.transparent,
        ),
      ),
    );
  }

 Widget _buildNumberButton(int num){
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: InkWell(
       onTap: (){
         setState(() {
           _input = _input + num.toString();
         });
       },
       customBorder: CircleBorder(),
       child: Container(
         width: 60.0,
         height: 60.0,
         alignment: Alignment.center,
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           border: Border.all(
             color: Colors.black45,
             width: 1.0,
           ),
         ),
         child: Text(
             num.toString(),
             style: TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold
             ),
         ),
       ),
     ),
   );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image/valoant_logo.png', width: 200.0),
          Text('please Enter Your PIN'),
          SizedBox(
            height: 14.0
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIndicator(_input.length >= 1 ?  true : false),
              _buildIndicator(_input.length >= 2 ?  true : false),
              _buildIndicator(_input.length >= 3 ?  true : false),
              _buildIndicator(_input.length >= 4 ?  true : false),
              _buildIndicator(_input.length >= 5 ?  true : false),
              _buildIndicator(_input.length >= 6 ?  true : false),
            ],
          ),
          SizedBox(height: 36,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(1),
                  _buildNumberButton(2),
                  _buildNumberButton(3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(4),
                  _buildNumberButton(5),
                  _buildNumberButton(6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(7),
                  _buildNumberButton(8),
                  _buildNumberButton(9),
                ],
              ),
            ],
          ),
          Text(_input),
        ],
      ),
    );
  }
}
