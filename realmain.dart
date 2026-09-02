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
    "id": next_id,
    "Name": name,
    "Course": course,
    "Year_Level": yearLevel
  });
  
  print("=====Student was sucessfully added.======\n");
}

void viewStudents() {
  print("\n=============Viewing Students============");
  if (students.isEmpty){
    print("No Records Found");
  }

  for (int i = 0; i < students.length; i++){
    var student = students [i];
    print("Name: ${student["Name"]}");
    print("Course: ${student["Course"]}");
    print("Year Level: ${student["Year_Level"]}\n");
  }
  print("==========================================\n");
}

void updateStudent() {
  if (students.isEmpty){
    print("No Records Found");
  }

  

}

void deleteStudent() {
  if (students.isEmpty){
    print("No Records Found");
  }


}











