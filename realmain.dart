import 'dart:io';

List<Map<String,dynamic>> students =[];
 int next_id = 1;

void main(){
  while (true){
    print("==========================================");
    print("========Student Information System========");
    print("==========================================");
    print("1. Add");
    print("2. New");
    print("3. Update");
    print("4. Delete");
    print("5. Exit");
    print("==========================================");
    stdout.write("Choose from 1-5: ");
    int Chooser = int.parse(stdin.readLineSync()!);

    switch(Chooser){
      case 1:
        addStudent();
        break;

      case 2: 
        viewStudents();
        break;

      case 3: 
        print("update");
        updateStudent();
        break;

      case 4: 
        print("delete");
        break;

      case 5: 
        print("Exiting Program");
        return;
    }
  }
}

void addStudent() {
  print("\n=============Adding Students=============");

  stdout.write("Enter Student Name: ");
  String? name = stdin.readLineSync();
  stdout.write("Enter Student Course: ");
  String? course = stdin.readLineSync();
  stdout.write("Enter Student Year Level: ");
  String? yearLevel = stdin.readLineSync();

  students.add({
    "ID": next_id,
    "Name": name,
    "Course": course,
    "Year_Level": yearLevel
  });
  next_id ++;

  print("=====Student was sucessfully added.======\n");
}

void viewStudents() {
  print("\n=============Viewing Students============");
  if (students.isEmpty){
    print("No Records Found");
  }

  for (int i = 0; i < students.length; i++){
    var student = students [i];
    print("ID: ${student["ID"]}");
    print("Name: ${student["Name"]}");
    print("Course: ${student["Course"]}");
    print("Year Level: ${student["Year_Level"]}\n");
  }
  print("==========================================\n");
}

int? searchStudent(){
  if (students.isEmpty){
    print("No Records Found");
  }

  stdout.write("Enter Student ID: "); 
  int? id = int.tryParse(stdin.readLineSync()!);

  for(int i = 0; i < students.length; i++){
    if (students[i]["ID"] == id) {
      return i;
    }
  }
  return null;
}

void updateStudent() {
  if (students.isEmpty){
    print("No Records Found");
  }
  
  
  int? index = searchStudent();
  
  if (index == null){
      return;
  }
  var student = students[index];
  
  stdout.write("Enter new Name: ");
  String? newName = stdin.readLineSync();
  student["Name"] = newName;

  stdout.write("Enter new Name: ");
  String? newCourse = stdin.readLineSync();
  student["Course"] = newCourse;

  stdout.write("Enter new Name: ");
  STRING? newYear_Level = stdin.readLineSync();
  student["Year_Level"] = newYear_Level;  

}

void deleteStudent() {
  if (students.isEmpty){
    print("No Records Found");
    
     int? index = searchStudent();
     if (index == null) return;
     students.removeAt(index);
     print("Student deleted.");
  }


}