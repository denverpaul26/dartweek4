import 'dart:io';
List<Map<String,dynamic>> students=[];
    void main(){
        print(" ============================");
        print("| STUDENT INFORMATION SYSTEM |");
        print(" ============================");
        print("   0. SEARCH STUDENT");
        print("   1. ADD STUDENT");
        print("   2. VIEW STUDENT LIST");
        print("   3. UPDATE STUDENT INFO");
        print("   4. DELETE STUDENT INFO");
        print("\nEnter your choice (0/1/2/3/4): ");
        print("");
        
            String? menu = stdin.readLineSync();
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
                break;
                case "3":
                print("UPDATE STUDENT INFO");
                break;
                case "4":
                print("DELETE STUDENT INFO");
                break;
                default:
                print("Invalid Input");
            }
    }

    void addStudent(){
        stdout.write("Enter your name: ");
        String? name = stdin.readLineSync();

        stdout.write("Enter your Age: ");
        String? age = stdin.readLineSync();

        stdout.write("Enter your Course: ");
        String? course = stdin.readLineSync();

        stdout.write("Enter your GWA: ");
        double gwa = double.parse(stdin.readLineSync()!);

        var status = gwa;

        if (gwa <= 1.75) {
        print("Excellent");
        } else if (gwa <= 2.75) {
        print("Very Good");
        } else if (gwa <= 3.75) {
        print("PasseD");
        } else {
        print("Probation");
        }
        
        students.add({"name" : name, "age" : age, "Course" : course, "gwa" : gwa, "status" : status});
        print("Added successfully");
    }