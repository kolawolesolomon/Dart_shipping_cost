// import 'package:shipping_cost/shipping_cost.dart' as shipping_cost;
import "dart:io";

File destinationFile = File(
    'destination.txt'); //This is the globalVariable to hold the file ceing created i.e a file object.
List<String> destinationList =
    []; // This is the global variable to hold the list of destinations.

void main() {
  print("\n\tWelcome to eSHIP!\n");
  print("""
        What would you like to do? \n
        
        1. Add new destination.
        2. Calculate shippping cost.
        3. Show available destinations. \n

        Enter the appropriate number for your selection!
        
        """);

  String? rawUserSelection = stdin.readLineSync();

  int? userSelection = int.tryParse(rawUserSelection ?? '');

  if (userSelection != null) {
    if (userSelection == 1) {
      addDestination();
      print('Done');
    } else if (userSelection == 2) {
      calculateShippingCost();
    } else if (userSelection == 3) {
      showDestination();
    } else {
      print('Selection out of range!');
    }
  } else {
    print('Enter a valid input!');
  }
}

void calculateShippingCost() {
  print('Calculating!');
}

void showDestination() {
  print('Showing');
}

void addDestination() async {
  // destinationFile.writeAsString("Hello My dear sister!");
  if (await destinationFile.exists() == true) {
    print('Destination file exists!');
    String destination = userAddDestinationInput();
    if (destination == '') {
      print('You did not enter a destination!');
    } else {
      destinationList.add(destination);
      destinationFile.writeAsStringSync(destination,
        mode: FileMode.append);
    }
    print(destinationList);
  } else {
    print('Destination file does not exist!  but will be created!');
    destinationFile.writeAsStringSync(userAddDestinationInput(),
        mode: FileMode.append);
    destinationList.add(userAddDestinationInput());
    print(destinationList);
    print(destinationFile.readAsStringSync());
  }
}

String userAddDestinationInput() {
  print('Enter the destination you want to add!');
  String? userInput = stdin.readLineSync();
  if (userInput == null) {
    print('You did not enter a destination!');
    return '';
  } else {
    return userInput;
  }
}
