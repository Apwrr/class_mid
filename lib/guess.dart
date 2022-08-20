import 'dart:io';
import 'game.dart';

void main() {
  var game = Game();
  print('╔═════════════════════════════════════');
  print('║            GUESS THE NUMBER         ');
  print('║─────────────────────────────────────');

  int result = 1;
  int again = 0;
  int count = 0;
  do {
    if (result == 0) {
      again = 0;
      stdout.write('║ Do you want to play again? y/n: ');
      var reply = stdin.readLineSync();
      if (reply!.compareTo('y') == 0) {
        print('╚═════════════════════════════════════');
        again = 1;
        count = 0;
        game = Game();
        print('╔═════════════════════════════════════');
        print('║            GUESS THE NUMBER         ');
        print('║─────────────────────────────────────');
      }
    }
    if (result != 0 || again == 1) {
      stdout.write('║ Please guess the between 1 and 100: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);

      if (guess == null) {
        print('please enter number only');
        print('║─────────────────────────────────────');
        continue;
      } else {
        count++;
      }

      //result = game.doGuess(guess, count);
      if (result == 0) {
        again = 1;
      }
    }
  } while (result != 0 || again == 1);
  print('║─────────────────────────────────────');
  print('║                THE END              ');
  print('╚═════════════════════════════════════');
}
