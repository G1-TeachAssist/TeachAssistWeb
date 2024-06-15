import 'package:teach_assist_web/models/teacher.dart';

class TeacherController {
  static final TeacherController instance = TeacherController();

  final List<Teacher> _teachers = [
    Teacher(id: 1, name: 'Olivia Alves', email: 'olivia.alves@email.com'),
    Teacher(id: 2, name: 'Denis Moreira', email: 'denis.moreira@email.com')
  ];

  List<Teacher> getTeachers() {
    return _teachers;
  }

  void addTeacher(String name, String email) {
    Teacher teacher = Teacher(id: 25, name: name, email: email);
    getTeachers().add(teacher);
  }
}
