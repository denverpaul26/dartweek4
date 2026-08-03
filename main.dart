import 'dart:io';

List<Map<String, dynamic>> students = [];

void main() {
  String? menu;

  do {
    print(" ============================");
    print("| STUDENT INFORMATION SYSTEM |");
    print(" ============================");
    print("   0. SEARCH STUDENT");
    print("   1. ADD STUDENT");
    print("   2. VIEW STUDENT LIST");
    print("   3. UPDATE STUDENT INFO");
    print("   4. DELETE STUDENT INFO");
    print("   5. COMPUTE CLASS AVERAGE");
    print("   6. DISPLAY STUDENT WITH HIGHEST GRADE & LOWEST GRADE");
    print("   7. ");
    print("   8. EXIT");
    stdout.write("\nEnter your choice (0-8): ");

    menu = stdin.readLineSync();

    switch (menu) {
      case "0":
        print("SEARCH STUDENT");
        break;
      case "1":
        print("ADD STUDENT");
        addStudent();
        break;
      case "2":
        print("VIEW STUDENT LIST");
        viewStudents();
        break;
      case "3":
        print("UPDATE STUDENT INFO");
        break;
      case "4":
        print("DELETE STUDENT INFO");
        break;
      case "5":
        print("COMPUTE CLASS AVERAGE");
        break;
      case "6":
        print("Display Student With Highest Grade & Lowest Grade");
        displayHighestLowest();
        break;
      case "7":
        print("Option 7 not yet implemented");
        break;
      case "8":
        print("EXITING PROGRAM...");
        break;
      default:
        print("Invalid Input");
    }
    print("");
  } while (menu != "8");
}

void addStudent() {
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter your Age: ");
  String? age = stdin.readLineSync();

  stdout.write("Enter your Course: ");
  String? course = stdin.readLineSync();

  stdout.write("Enter your GWA: ");
  double gwa = double.parse(stdin.readLineSync()!);

  String status;
  if (gwa <= 1.75) {
    status = "Excellent";
  } else if (gwa <= 2.75) {
    status = "Very Good";
  } else if (gwa <= 3.75) {
    status = "Passed";
  } else {
    status = "Probation";
  }

  students.add({
    "name": name,
    "age": age,
    "Course": course,
    "gwa": gwa,
    "status": status
  });
  print("Added successfully");
}

void viewStudents() {
  if (students.isEmpty) {
    print("No students found.");
  } else {
    for (var student in students) {
      print(student);
    }
  }
}

void displayHighestLowest() {
  if (students.isEmpty) {
    print("No students available.");
    return;
  }


  var highest = students.reduce((a, b) => a["gwa"] < b["gwa"] ? a : b);
  var lowest = students.reduce((a, b) => a["gwa"] > b["gwa"] ? a : b);

  print("Highest Grade Student: ${highest["name"]}, GWA: ${highest["gwa"]}");
  print("Lowest Grade Student: ${lowest["name"]}, GWA: ${lowest["gwa"]}");
}
