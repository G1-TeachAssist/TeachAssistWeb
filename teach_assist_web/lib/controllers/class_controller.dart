import 'package:teach_assist_web/controllers/discipline_controller.dart';
import 'package:teach_assist_web/controllers/teacher_controller.dart';
import 'package:teach_assist_web/models/class.dart';

class ClassController {
  static final ClassController instance = ClassController();

  final List<Class> _classes = [
    Class(id: 1, teacher: TeacherController.instance.getTeachers()[0], discipline: DisciplineController.instance.getDisciplines()[0], students: [], startAt: DateTime.now(), type: 'Semestral', status: 'Em andamento', minFinalMedia: 70),
    Class(id: 2, teacher: TeacherController.instance.getTeachers()[1], discipline: DisciplineController.instance.getDisciplines()[1], students: [], startAt: DateTime.now(), type: 'Bimestral', status: 'Em andamento', minFinalMedia: 50),
    Class(id: 3, teacher: TeacherController.instance.getTeachers()[1], discipline: DisciplineController.instance.getDisciplines()[2], students: [], startAt: DateTime.now(), type: 'Bimestral', status: 'Em andamento', minFinalMedia: 50),
  ];

  List<Class> getClasses() {
    return _classes;
  }

  void addClass(Class newClass) {
    getClasses().add(newClass);
  }
}
