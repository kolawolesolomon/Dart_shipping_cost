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
      print('Enter a valid input! Try again!\n');      
    } else {
      if (userInputP== 1) {
        addDestination(createFile());
        print('Congratulatinos! Destination Added...');
        userAnswer = 0;
      } else if (userInputP == 2) {
        calculateShippingCost();
        userAnswer = 0;
      } else if (userInputP == 3) {
        showDestination();
        userAnswer = 0;
      } else {
        print('\nSelection out of range! Try again!\n');
      }
    }
  }
}
bool checkDestinationFile() {// Check if destination file exists and return true or false
  if (File('destination.txt').existsSync()) {
    return true;
  } else {
    return false;
  }
} // checkDestinationFile
void showDestination() { // Show available destinations
  print('Showing');
}
void calculateShippingCost() { // Calculate shipping cost
  print('Calculating');
}
File createFile(){ // Create destination file by first checking if it exists
  if (checkDestinationFile() == false){
    print('Destination log/directory has now been created on your device!');
    File destinationFile = File('destination.txt'); // initializing File to store destinations
    destinationFile.createSync(); // creating the file
    return destinationFile; // creating the file
  } else {
    print('Destination log/directory found!');
    return File('destination.txt');
  }
} // createFile
void addDestination(File createdDocument) { // Add user input destination to file
  print('\n\nEnter destination name: ');
  String? destinationName = stdin.readLineSync();
  createdDocument.writeAsString(destinationName!, mode: FileMode.append); // Writing destination to file
} // addDestination 