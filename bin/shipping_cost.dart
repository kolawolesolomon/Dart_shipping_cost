// import 'package:shipping_cost/shipping_cost.dart' as shipping_cost;
import "dart:io";


void main() {
  print("\n\tWelcome to eSHIP!\n");
  print("""
        What would you like to do? \n
        
        1. Add new destination.
        2. Calculate shippping cost.
        3. Show available destinations. \n

        Enter the appropriate number for your selection!
        
        """);
int userAnswer = 1;
  while (userAnswer == 1) {
    String? rawInput = stdin.readLineSync();
    int? userInputP = int.tryParse(rawInput ?? '');

    if (userInputP == null) {
      print('Enter a valid input!');      
    } else {
      if (userInputP== 1) {
        checkDestinationFile();
        print('Done');
        userAnswer = 0;
      } else if (userInputP == 2) {
        calculateShippingCost();
        userAnswer = 0;
      } else if (userInputP == 3) {
        showDestination();
        userAnswer = 0;
      } else {
        print('Selection out of range!');
      }
    }
  }
}

dynamic checkDestinationFile() {// Check if destination file exists
  if (File('destination.txt').existsSync()) {
    return true;
  } else {
    return false;
  }
} // checkDestinationFile

void showDestination() {
  print('Showing');
}


void calculateShippingCost() {
  print('Calculating');
}


void createFile(){
  if (checkDestinationFile() == false){
    File destinationFile = File('destination.txt'); // initializing File to store destinations
    destinationFile.createSync(); // creating the file
    addDestination();
  } else {
    addDestination();
  }
} // createFile

void addDestination() {
  print('add destination!');
}




// void addDestination() async {
//   // destinationFile.writeAsString("Hello My dear sister!");
//   if (await destinationFile.exists() == true) {
//     print('Destination file exists!');
//     String destination = userAddDestinationInput();
//     if (destination == '') {
//       print('You did not enter a destination!');
//     } else {
//       destinationList.add(destination);
//       destinationFile.writeAsStringSync(destination,
//         mode: FileMode.append);
//     }
//     print(destinationList);
//   } else {
//     print('Destination file does not exist!  but will be created!');
//     destinationFile.writeAsStringSync(userAddDestinationInput(),
//         mode: FileMode.append);
//     destinationList.add(userAddDestinationInput());
//     print(destinationList);
//     print(destinationFile.readAsStringSync());
//   }
// }

// String userAddDestinationInput() {
//   print('Enter the destination you want to add!');
//   String? userInput = stdin.readLineSync();