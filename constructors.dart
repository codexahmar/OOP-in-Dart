import 'dart:io';

void main() {
  List<StudentDetails> details = [];
  bool continueProgram = true;

  while (continueProgram) {
    print("Menu:");
    print("1. Add Student");
    print("2. Display Students");
    print("3. Exit");
    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        pushData(details);
        break;
      case '2':
        displayInfo(details);
        break;
      case '3':
        continueProgram = false;
        break;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

class StudentDetails {
  String name;
  int idCard;
  int age;
  double gpa;
  int semester;

  StudentDetails(this.name, this.idCard, this.age, this.gpa, this.semester);
}

void pushData(List<StudentDetails> details) {
  try {
    stdout.write("Enter the student name: ");
    String? name = stdin.readLineSync();
    if (name == null || name.isEmpty) {
      print("Name cannot be empty.");
      return;
    }

    stdout.write("Enter the student id: ");
    int idCard = int.parse(stdin.readLineSync()!);

    stdout.write("Enter the student age: ");
    int age = int.parse(stdin.readLineSync()!);

    stdout.write("Enter the student gpa: ");
    double gpa = double.parse(stdin.readLineSync()!);

    stdout.write("Enter the student semester: ");
    int semester = int.parse(stdin.readLineSync()!);

    StudentDetails student = StudentDetails(name, idCard, age, gpa, semester);
    details.add(student);
    print("Student added successfully.");
  } catch (e) {
    print("Invalid input. Please try again.");
  }
}

void displayInfo(List<StudentDetails> details) {
  if (details.isEmpty) {
    print("No student data available.");
    return;
  }

  print("--------------");
  for (var student in details) {
    print("Student Name: ${student.name}");
    print("Student ID: ${student.idCard}");
    print("Student Age: ${student.age}");
    print("Student GPA: ${student.gpa}");
    print("Student Semester: ${student.semester}");
    print("--------------");
  }
}
