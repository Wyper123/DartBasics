import 'dart:io';
List<Map<String,dynamic>>students = [];

void main(){
  print("===========================================");
  print("========Student Information System=========");
  print("===========================================");

  print("Select the following:");
  print("0. Search Student");
  print("1. Add Student");
  print("2. View Student");
  print("3. Update Student Info");
  print("4. Delete Student Info");
  print("(Others Exit)");
  print("");

  stdout.write("Enter your Choice: ");
  String? chooser = stdin.readLineSync();
  switch (chooser) {
    case "0":
    print("Search Student");
    break;

    case "1":addStudent();
    print("The Student info was added successfully.");
    break;

    case "2":
    print("View Student");
    break;

    case "3":
    print("Update Student Info");
    break;

    case "4":
    print("Delete Student Info");
    break;

    default:
    print("Exit");
  }
}

void addStudent(){
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();
  stdout.write("Enter your age: ");
  String? age = stdin.readLineSync();
  stdout.write("Enter your course: ");
  String? course = stdin.readLineSync();
  stdout.write("Enter your gwa: ");
  double gwa = double.parse(stdin.readLineSync()!);
  print("");
  var status = "";
    
  print("========Student Information System=========");
  print("Name: $name");
  print("Age: $age");
  print("Course: $course");
  print("GWA: $gwa");
    
  if (gwa <= 1.75) {
  print("Excellent");
  } else if (gwa <= 2.75) {
  print("Very Good");
  } else if (gwa <= 3) {
  print("Passed");
  } else {
  print("Probation");
  }
  print("===========================================");

  students.add({
    "Name": name,
    "Age": age,
    "Course": course,
    "GWA": gwa,
    "Status": status
  });
  print("");
}