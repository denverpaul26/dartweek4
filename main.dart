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
    print("   7. COUNT TOTAL STUDENTS");
    print("   8. EXIT");
    stdout.write("\nEnter your choice (0-8): ");

    menu = stdin.readLineSync();

    if (menu == "0") {
      print("SEARCH STUDENT");
      searchStudent();
    } else if (menu == "1") {
      print("ADD STUDENT");
      addStudent();
    } else if (menu == "2") {
      print("VIEW STUDENT LIST");
      viewStudents();
    } else if (menu == "3") {
      print("UPDATE STUDENT INFO");
      updateStudent();
    } else if (menu == "4") {
      print("DELETE STUDENT INFO");
      deleteStudent();
    } else if (menu == "5") {
      print("COMPUTE CLASS AVERAGE");
      computeClassAverage();
    } else if (menu == "6") {
      print("Display Student With Highest Grade & Lowest Grade");
      displayHighestLowest();
    } else if (menu == "7") {
      print("COUNT TOTAL STUDENTS");
      countStudents();
    } else if (menu == "8") {
      print("EXIT");
    } else {
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
    return;
  }

  stdout.write("Enter course to filter (or press Enter to show all): ");
  String? courseFilter = stdin.readLineSync();

  bool found = false;
  for (int i = 0; i < students.length; i++) {
    var student = students[i];
    if (courseFilter == null || courseFilter.trim().isEmpty ||
        student["Course"].toString().toLowerCase() == courseFilter.toLowerCase()) {
      print("${i + 1}. Name: ${student["name"]}, Age: ${student["age"]}, "
          "Course: ${student["Course"]}, GWA: ${student["gwa"]}, "
          "Status: ${student["status"]}");
      found = true;
    }
  }

  if (!found && courseFilter != null && courseFilter.trim().isNotEmpty) {
    print("No students found in course $courseFilter.");
  }
}

void searchStudent() {
  stdout.write("Enter name to search: ");
  String? searchName = stdin.readLineSync();

  bool found = false;
  for (var student in students) {
    if (student["name"].toString().toLowerCase() == searchName?.toLowerCase()) {
      print("Found: Name: ${student["name"]}, Age: ${student["age"]}, "
          "Course: ${student["Course"]}, GWA: ${student["gwa"]}, "
          "Status: ${student["status"]}");
      found = true;
    }
  }

  if (!found) {
    print("No student found with name $searchName.");
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

  double sum = 0;
  for (var student in students) {
    sum += student["gwa"];
  }
  double avg = sum / students.length;
  print("Class Average GWA: $avg");
}

void displayHighestLowest() {
  if (students.isEmpty) {
    print("No students available.");
    return;
  }

  var highest = students[0];
  var lowest = students[0];

  for (var student in students) {
    if (student["gwa"] < highest["gwa"]) {
      highest = student;
    }
    if (student["gwa"] > lowest["gwa"]) {
      lowest = student;
    }
  }

  print("Highest Grade Student: ${highest["name"]}, GWA: ${highest["gwa"]}");
  print("Lowest Grade Student: ${lowest["name"]}, GWA: ${lowest["gwa"]}");
}

void countStudents() {
  print("Total number of students: ${students.length}");
}
