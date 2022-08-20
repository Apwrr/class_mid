import 'package:class_mid/game.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Mycontroller = TextEditingController();
  final MyGame = Game();
  var feedback = '';
  var showButton = false;

  void handleClick() {
    setState(() {
      showButton = ! showButton;
    });
    print('Click');
    print(Mycontroller.text);
    var guess = int.tryParse((Mycontroller.text));

    if(guess == null){
      //error
      setState(() {
        feedback = 'Input error, please try again';
      });
      print('Input error');

    } else{
      var result = MyGame.doGuess(guess);
      if(result == Result.tooHigh){
        print('Too high');
        setState(() {
        feedback = 'Too high, please try again!!!';
        });
      } else if(result == Result.tooLow){
        print('Too Low');
        setState(() {
          feedback = 'Too Low, please try again!!!';
        });
      } else{
        print('correct');
        setState(() {
          feedback = 'Good job!';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guess The Number')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        /*decoration: BoxDecoration(
        border: Border.all(color: Colors.green)
      ),*/
        children: [
          const Text('Please enter number between 1 and 100'),
           TextField(
            controller: Mycontroller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Enter a number',
            ),
          ),
          //Callback
          ElevatedButton(onPressed: handleClick, child: Text('GUESS'),
          ),
          Text(feedback),

          showButton
          ? OutlinedButton(
              onPressed: (){},
              child: Text(''),
          )
           :SizedBox.shrink()
        ],
      ),
    );
  }
}
