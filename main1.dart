import 'dart:io';

class Student {
  String _name;
  String _age;
  String _course;
  double _gwa;
  String _status = "";

  Student(this._name, this._age, this._course, this._gwa) {
    _updateStatus();
  }

  String get name => _name;
  String get age => _age;
  String get course => _course;
  double get gwa => _gwa;
  String get status => _status;

  set name(String value) => _name = value;
  set age(String value) => _age = value;
  set course(String value) => _course = value;

  set gwa(double value) {
    _gwa = value;
    _updateStatus();
  }

  void _updateStatus() {
    if (_gwa <= 1.75) {
      _status = "Excellent";
    } else if (_gwa <= 2.75) {
      _status = "Very Good";
    } else if (_gwa <= 3.0) {
      _status = "Passed";
    } else {
      _status = "Probation";
    }
  }

  void displayInfo() {
    print("Name: $_name");
    print("Age: $_age");
    print("Course: $_course");
    print("GWA: $_gwa");
    print("Status: $_status");
  }
}

List<Student> students = [];

void main() {
  print("===========================================");
  print("========Student Information System=========");
  print("===========================================");

  bool Running = true;
  while (Running) {
    print("")
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

    stdout.write("Enter your Choice: ");
    String? chooser = stdin.readLineSync();

    switch (chooser) {
      case "0":
        searchStudent();
        break;

      case "1":
        addStudent();
        break;

      case "2":
        viewStudent();
        break;

      case "3":
        updateStudentInfo();
        break;

      case "4":
        deleteStudent();
        break;

      case "5":
        computeClassAverage();
        break;

      case "6":
        highestGrade();
        break;

      case "7":
        lowestGrade();
        break;

      case "8":
        print("Exiting Program");
        Running = false;
        break;

      default:
        print("Invalid Choice. Please try again.");
    }
  }
}

void searchStudent() {
  print("");
  stdout.write("Enter student name: ");
  String? searchName = stdin.readLineSync();
  bool found = false;

  for (var student in students) {
    if (student.name == searchName) {
      print("\n========Search Result=========");
      student.displayInfo();
      print("================================");
      found = true;
      break;
    }
  }

  if (!found) {
    print("Student not found.");
  }
}

void addStudent() {
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

  Student student = Student(name!, age!, course!, gwa);

  print("========Student Information System=========");
  student.displayInfo();
  print("===========================================");

  students.add(student);
  print("The Student info was added successfully.\n");
}

void viewStudent() {
  print("");
  if (students.isEmpty) {
    print("No students found.");
    return;
  }

  for (var student in students) {
    print("========View Student Information=========");
    student.displayInfo();
    print("===========================================\n");
  }
}

void updateStudentInfo() {
  print("");
  stdout.write("Enter student name to update: ");
  String? searchName = stdin.readLineSync();
  bool found = false;

  for (var student in students) {
    if (student.name == searchName) {
      print("\n--- Enter New Information ---");
      stdout.write("Enter new name: ");
      student.name = stdin.readLineSync()!;
      stdout.write("Enter new age: ");
      student.age = stdin.readLineSync()!;
      stdout.write("Enter new course: ");
      student.course = stdin.readLineSync()!;
      stdout.write("Enter new gwa: ");
      double newGwa = double.parse(stdin.readLineSync()!);
      student.gwa = newGwa;
      print("");

      print("========Update Result=========");
      student.displayInfo();
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
  stdout.write("Enter student name to delete: ");
  String? searchName = stdin.readLineSync();
  bool found = false;

  for (int i = 0; i < students.length; i++) {
    if (students[i].name == searchName) {
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
    totalGWA += student.gwa;
  }

  double classAverage = totalGWA / students.length;
  print("========Class Average=========");
  print("Class Average GWA: ${classAverage.toStringAsFixed(2)}");
  print("================================");
}

void highestGrade() {
  print("");
  if (students.isEmpty) {
    print("No students found.");
    return;
  }

  var highestStudent = students[0];
  for (var student in students) {
    if (student.gwa < highestStudent.gwa) {
      highestStudent = student;
    }
  }

  print("========Student With Highest Grade=========");
  print("(Lower GWA = Higher Grade)");
  highestStudent.displayInfo();
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
    if (student.gwa > lowestStudent.gwa) {
      lowestStudent = student;
    }
  }

  print("========Student With Lowest Grade=========");
  print("(Higher GWA = Lower Grade)");
  lowestStudent.displayInfo();
  print("===========================================");
}