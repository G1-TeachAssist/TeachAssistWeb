import 'package:teach_assist_web/controllers/discipline_controller.dart';
import 'package:teach_assist_web/controllers/student_controller.dart';
import 'package:teach_assist_web/controllers/teacher_controller.dart';
import 'package:teach_assist_web/enums/aval_enum.dart';
import 'package:teach_assist_web/models/class.dart';
import 'package:teach_assist_web/models/grade.dart';
import 'package:teach_assist_web/models/student.dart';

class ClassController {
  static final ClassController instance = ClassController();

  final List<Class> _classes = [
    Class(id: 1, teacher: TeacherController.instance.getTeachers()[0], discipline: DisciplineController.instance.getDisciplines()[0], students: StudentController.instance.getStudents(), startAt: DateTime.now(), type: 'Semestral', status: 'Em andamento', minFinalMedia: 70, grades: []),
    Class(id: 2, teacher: TeacherController.instance.getTeachers()[1], discipline: DisciplineController.instance.getDisciplines()[1], students: [], startAt: DateTime.now(), type: 'Bimestral', status: 'Em andamento', minFinalMedia: 50, grades: []),
    Class(id: 3, teacher: TeacherController.instance.getTeachers()[1], discipline: DisciplineController.instance.getDisciplines()[2], students: [], startAt: DateTime.now(), type: 'Bimestral', status: 'Em andamento', minFinalMedia: 50, grades: []),
  ];

  List<Class> getClasses() {
    return _classes;
  }

  List<Class> getClassesByYear(int year) {
    List<Class> results = [];
    for(Class classFind in getClasses()){
      if(classFind.startAt.year == year){
        results.add(classFind);
      }
    }
    return results;
  }

  void addClass(Class newClass) {
    getClasses().add(newClass);
  }

  String getGradesFromStudent(Class actualClass, Student student){
    String grades = '';
    for(Grade grade in actualClass.grades){
      if(grade.student == student && grade.turma == actualClass){
        grades += grades == '' ? '${grade.aval.displayName}: ${grade.grade}' : ' | ${grade.aval.displayName}: ${grade.grade.toStringAsFixed(1)}' ;
      }
    }
    return grades;
  }
}
