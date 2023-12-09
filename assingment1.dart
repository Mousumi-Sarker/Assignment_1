// A. Define the Role interface
abstract class Role {
  void displayRole();
}

// B. Implement the Person class
class Person implements Role {
  String name;
  int age;
  String address;
  Role role;

  Person(this.name, this.age, this.address, this.role);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {
    print('Role:');
    role.displayRole();
  }
}

// C. Student class, extending Person
class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores = [];
  Student (String name, int age, String address, Role role, this.studentID, this.grade)
      : super(name, age, address, role);

  @override
  void displayRole() {
    print('Role: Student');
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    int sum = courseScores.reduce((value, element) => value + element);
    return sum / courseScores.length;
  }
}
class StudentRole implements Role{
  @override
  void displayRole() {
    print('I am a Student');
  }
}
// D.Teacher class, extending Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught = [];

  Teacher (String name, int age, String address, Role role, this.teacherID)
      : super(name, age, address, role);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void displayCoursesTaught() {
    print('Courses Taught:');
    for (String course in coursesTaught) {
      print('- $course');
    }
  }
}
class TeacherRole implements Role {
  @override
  void displayRole() {
    print('I ama a Teacher');
  }
}
// E. StudentManagementSystem class
class StudentManagementSystem {
  static void main() {
    Role studentRole = StudentRole();
    Student student = Student('John Doe', 20, '123 Street, City', studentRole, '123456', 'A');

    Role teacherRole = TeacherRole();
    Teacher teacher = Teacher('Jane Smith', 30, '456 Avenue, Town', teacherRole, '789012');

    student.courseScores = [85, 90, 78, 92];
    teacher.coursesTaught = ['Mathematics', 'Science', 'English'];

    student.displayRole();
    teacher.displayRole();

    print('Student Name: ${student.getName}');
    print('Teacher Name: ${teacher.getName}');

    double averageScore = student.calculateAverageScore();
    print('Average Score: $averageScore');

    teacher.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem.main();
}