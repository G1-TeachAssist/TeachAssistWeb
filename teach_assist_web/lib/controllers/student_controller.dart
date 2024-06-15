import 'package:teach_assist_web/models/student.dart';

class StudentController {
  static final StudentController instance = StudentController();

  final List<Student> _students = [
    Student(id: 1, name: 'John Lee'),
    Student(id: 2, name: 'Barbara Rodriguez'),
    Student(id: 3, name: 'João da Silva')
  ];

  List<Student> getStudents() {
    return _students;
  }

  void addStudent(String name) {
    Student student = Student(id: 12, name: name);
    getStudents().add(student);
  }
}
