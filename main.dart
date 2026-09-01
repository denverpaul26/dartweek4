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
        searchStudent();
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
        updateStudent();
        break;
      case "4":
        print("DELETE STUDENT INFO");
        deleteStudent();
        break;
      case "5":
        print("COMPUTE CLASS AVERAGE");
        computeClassAverage();
        break;
      case "6":
        print("Display Student With Highest Grade & Lowest Grade");
        displayHighestLowest();
        break;
      case "7":
        print("Option 7 not yet implemented");
        break;
      case "8":
        print("EXIT");
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

void searchStudent() {
  stdout.write("Enter name to search: ");
  String? searchName = stdin.readLineSync();

  var found = students.where((s) => s["name"].toString().toLowerCase() == searchName?.toLowerCase()).toList();
  if (found.isEmpty) {
    print("No student found with name $searchName.");
  } else {
    print("Student found: $found");
  }
}

void updateStudent() {
  stdout.write("Enter name of student to update: ");
  String? name = stdin.readLineSync();

  for (var student in students) {
    if (student["name"].toString().toLowerCase() == name?.toLowerCase()) {
      stdout.write("Enter new Age: ");
      student["age"] = stdin.readLineSync();

      stdout.write("Enter new Course: ");
      student["Course"] = stdin.readLineSync();

      stdout.write("Enter new GWA: ");
      double gwa = double.parse(stdin.readLineSync()!);
      student["gwa"] = gwa;

      if (gwa <= 1.75) {
        student["status"] = "Excellent";
      } else if (gwa <= 2.75) {
        student["status"] = "Very Good";
      } else if (gwa <= 3.75) {
        student["status"] = "Passed";
      } else {
        student["status"] = "Probation";
      }

      print("Student info updated successfully.");
      return;
    }
  }
  print("Student not found.");
}

void deleteStudent() {
  stdout.write("Enter name of student to delete: ");
  String? name = stdin.readLineSync();

  int before = students.length;
  students.removeWhere((s) => s["name"].toString().toLowerCase() == name?.toLowerCase());
  if (students.length < before) {
    print("Deleted student $name successfully.");
  } else {
    print("No student found with name $name.");
  }
}

void computeClassAverage() {
  if (students.isEmpty) {
    print("No students available.");
    return;
  }

  double sum = students.fold(0, (prev, s) => prev + s["gwa"]);
  double avg = sum / students.length;
  print("Class Average GWA: $avg");
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
