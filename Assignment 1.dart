abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {}
}

class Student extends Person {
  int studentID;
  double? grade;
  List<double> courseScores;

  Student(
      String name, int age, String address, this.studentID, this.courseScores)
      : super(name, age, address);

  void calculateAverageScore() {
    grade = courseScores.reduce((a, b) => a + b) / courseScores.length;
    print(grade);
  }

  @override
  void displayRole() {
    print("Role: Student");
  }

  void studentInfo() {
    displayRole();
    print('Name: $name \nAge: $age \nAddress: $address \nAverage Score:');
    calculateAverageScore();
    print('\n');
  }
}

class Teacher extends Person {
  int teacherID;
  List<String> coursesTaught = [];

  Teacher(
    String name,
    int age,
    String address,
    this.teacherID,
  ) : super(name, age, address);

  void addCourseTaught(String course) {
    coursesTaught.add(course);
  }

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void teacherInfo() {
    displayRole();
    print('Name: $name \nAge: $age \nAddress: $address \nCourses Taught: ');
    for (String course in coursesTaught) {
      print(' $course');
    }
  }
}

void main() {
  Student student = Student("John Doe", 20, "123 Main St", 15412, [90, 85, 82]);
  Teacher teacher = Teacher("Mrs. Smith", 35, "456 Oak St", 22);

  teacher.addCourseTaught('Math');
  teacher.addCourseTaught('English');
  teacher.addCourseTaught('Bangla');

  student.studentInfo();
  teacher.teacherInfo();
}
