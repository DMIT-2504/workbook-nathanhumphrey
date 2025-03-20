import 'dart:io';

/// Returns a [String] from the user
///
/// Displays the passed in [message] as the prompt
/// to the user.
String prompt(String message) {
  stdout.write(message);
  return stdin.readLineSync()!;
}

/// Returns an [int]
///
/// Will continue to prompt the user until a valid [int] is entered.
/// Displayst the [message] as the prompt for the user.
int promptInt(String message) {
  bool isValid = false;

  while (!isValid) {
    try {
      return int.parse(prompt(message));
    } catch (e) {
      stdout.writeln('Invalid input. Please enter a whole number.');
    }
  }
}

int calculate() {
  return 6 * 7;
}
