import 'dart:io';
List<Map<String,dynamic>>students = [];

void main(){
  print("===========================================");
  print("========Student Information System=========");
  print("===========================================");

  bool Running = true;
  while (Running) {
    print("Select the following:");
    print("0. Search Student");
    print("1. Add Student");
    print("2. View Student");
    print("3. Update Student Info");
    print("4. Delete Student Info");
    print("5. Compute Class Average");
    print("6. Display Student With Highest Grade");
    print("7. Display Student With Lowest Grade");
    print("8. Exit");
    print("(Others Retry)");
    print("");

    stdout.write("Enter your Choice: ");
    String? chooser = stdin.readLineSync();
    switch (chooser) {
      case "0": searchStudent();
      print("");
      break;

      case "1":addStudent();
      print("The Student info was added successfully.");
      print("");
      break;

      case "2":viewStudent();
      print("");
      break;

      case "3":updateStudentInfo();
      print("");
      break;

      case "4": deleteStudent();
      print("");
      break;

      case "5": computeClassAverage();
      print("");
      break;

      case "6": highestGrade();
      print("");
      break;

      case "7": lowestGrade();
      print("");
      break;

      case "8":
      print("Exitting the program");
      Running = false;

      default:
      print("Invalid Choice. Please try again.");
    }
  }
  
}

void searchStudent(){
  print("");
  stdout.write("Enter student name: ");
  String? searchName = stdin.readLineSync();
  bool found = false;

  for (var student in students) {
    if (student['Name'] == searchName) {
      print("========Search Result=========");
      print("Name: ${student['Name']}");
      print("Age: ${student['Age']}");
      print("Course: ${student['Course']}");
      print("GWA: ${student['GWA']}");
      print("Status: ${student['Status']}");
      print("================================");
      found = true;
      break;
    }
  }

  if (!found) {
    print("Student not found.");
  }
}

void addStudent(){
  print("");
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
  print(status = "Excellent");
  } else if (gwa <= 2.75) {
  print(status = "Very Good");
  } else if (gwa <= 3) {
  print(status = "Passed");
  } else {
  print(status = "Probation");
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

void viewStudent(){
  print("");
  if (students.isEmpty) {
    print("No students found.");
    return;
  }

  for (var student in students) {
    print("========View Student Information=========");
    print("Name: ${student['Name']}");
    print("Age: ${student['Age']}");
    print("Course: ${student['Course']}");
    print("GWA: ${student['GWA']}");
    print("Status: ${student['Status']}");
    print("");
    print("===========================================");

  }
}

void updateStudentInfo(){
  stdout.write("Enter student name: ");
  String? searchName = stdin.readLineSync();
  bool found = false;

  for (var student in students) {
    if (student['Name'] == searchName) {
      stdout.write("Enter your name: ");
      student['Name'] = stdin.readLineSync();
      stdout.write("Enter your age: ");
      student['Age'] = stdin.readLineSync();
      stdout.write("Enter your course: ");
      student['Course'] = stdin.readLineSync();
      stdout.write("Enter your gwa: ");
      student['GWA'] = double.parse(stdin.readLineSync()!);
      print("");
      var status = "";

      if (student['GWA'] <= 1.75) {
      print(status = "Excellent");
      } else if (student['GWA'] <= 2.75) {
      print(status = "Very Good");
      } else if (student['GWA'] <= 3) {
      print(status = "Passed");
      } else {
      print(status = "Probation");
      }
      student['Status'] = status;

      print("========Update Result=========");
      print("Name: ${student['Name']}");
      print("Age: ${student['Age']}");
      print("Course: ${student['Course']}");
      print("GWA: ${student['GWA']}");
      print("Status: ${student['Status']}");
      print("================================");
      found = true;
      break;
    }
  }

  if (!found) {
    print("Student not found.");
  }
}

void deleteStudent() {
  print("");
  stdout.write("Enter student name: ");
  String? searchName = stdin.readLineSync();
  bool found = false;

  for (var i = 0; i < students.length; i++) {
    if (students[i]['Name'] == searchName) {
      students.removeAt(i);
      print("Student info deleted successfully.");
      found = true;
      break;
    }
  }

  if (!found) {
    print("Student not found.");
  }
}

void computeClassAverage() {
  print("");
  if (students.isEmpty) {
    print("No students found.");
    return;
  }

  double totalGWA = 0;
  for (var student in students) {
    totalGWA += student['GWA'];
  }

  double classAverage = totalGWA / students.length;
  print("Class Average GWA: ${classAverage.toStringAsFixed(2)}");
}

void highestGrade() {
  print("");
  if (students.isEmpty) {
    print("No students found.");
    return;
  }

  var highestStudent = students[0];
  for (var student in students) {
    if (student['GWA'] < highestStudent['GWA']) {
      highestStudent = student;
    }
  }

  print("========Student With Highest Grade=========");
  print("Name: ${highestStudent['Name']}");
  print("Age: ${highestStudent['Age']}");
  print("Course: ${highestStudent['Course']}");
  print("GWA: ${highestStudent['GWA']}");
  print("Status: ${highestStudent['Status']}");
  print("===========================================");
}

void lowestGrade() {
  print("");
  if (students.isEmpty) {
    print("No students found.");
    return;
  }

  var lowestStudent = students[0];
  for (var student in students) {
    if (student['GWA'] > lowestStudent['GWA']) {
      lowestStudent = student;
    }
  }

  print("========Student With Lowest Grade=========");
  print("Name: ${lowestStudent['Name']}");
  print("Age: ${lowestStudent['Age']}");
  print("Course: ${lowestStudent['Course']}");
  print("GWA: ${lowestStudent['GWA']}");
  print("Status: ${lowestStudent['Status']}");
  print("===========================================");
}
