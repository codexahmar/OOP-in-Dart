void main() {
  StudentDetails studentDetails = StudentDetails();
  studentDetails.name = "Ahmaryar khan";
  studentDetails.idCard = 65;
  studentDetails.age = 20;
  studentDetails.semester = 5;
  studentDetails.gpa = 3.5;
  studentDetails.displayInfo();
}

class StudentDetails {
  String? name;
  int? idCard;
  int? age;
  int? semester;
  double? gpa;
  void displayInfo() {
    print("Student Name: $name");
    print("Registration Number: $idCard");
    print("Student Age: $age");
    print("Student Semester: $semester");
    print("Student GPA:  $gpa");
  }

  // Call this function in case you want to update data
  void updateData(String newName, int newIdCard, int newAge, int newSemester,
      double newGpa) {
    name = newName;
    print("Updated Student Name: $newName");
    idCard = newIdCard;
    print("Updated Student Registration Number: $newIdCard");
    age = newAge;
    print("Updated Student Age: $newAge");
    semester = newSemester;
    print("Updated Student Semester: $newSemester");
    gpa = newGpa;
    print("Updated Student GPA: $newGpa");
  }
}
