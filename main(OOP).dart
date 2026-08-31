import 'dart:io';

class Student {
  String _name;
  String _age;
  String _course;
  double _gwa;
  String _status;

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
    } else if (_gwa <= 3) {
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
      case "0":
        searchStudent();
        print("");
        break;

      case "1":
        addStudent();
        print("The Student info was added successfully.");
        print("");
        break;

      case "2":
        viewStudent();
        print("");
        break;

      case "3":
        updateStudentInfo();
        print("");
        break;

      case "4":
        deleteStudent();
        print("");
        break;

      case "5":
        computeClassAverage();
        print("");
        break;

      case "6":
        highestGrade();
        print("");
        break;

      case "7":
        lowestGrade();
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

void searchStudent() {
  print("");
  stdout.write("Enter student name: ");
  String? searchName = stdin.readLineSync();
  bool found = false;

  for (var student in students) {
    if (student.name == searchName) {
      print("========Search Result=========");
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
  print("");
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
    print("");
    print("===========================================");
  }
}

void updateStudentInfo() {
  stdout.write("Enter student name: ");
  String? searchName = stdin.readLineSync();
  bool found = false;

  for (var student in students) {
    if (student.name == searchName) {
      stdout.write("Enter your name: ");
      student.name = stdin.readLineSync()!;
      stdout.write("Enter your age: ");
      student.age = stdin.readLineSync()!;
      stdout.write("Enter your course: ");
      student.course = stdin.readLineSync()!;
      stdout.write("Enter your gwa: ");
      double newGwa = double.parse(stdin.readLineSync()!);
      student.gwa = newGwa;
      print("");
      print(student.status);

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
  stdout.write("Enter student name: ");
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
    if (student.gwa < highestStudent.gwa) {
      highestStudent = student;
    }
  }

  print("========Student With Highest Grade=========");
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
  lowestStudent.displayInfo();
  print("===========================================");
}