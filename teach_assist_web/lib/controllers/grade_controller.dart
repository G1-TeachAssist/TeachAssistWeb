import 'package:teach_assist_web/controllers/class_controller.dart';
import 'package:teach_assist_web/controllers/student_controller.dart';
import 'package:teach_assist_web/enums/aval_enum.dart';
import 'package:teach_assist_web/models/class.dart';
import 'package:teach_assist_web/models/grade.dart';

class GradeController{
  static final GradeController instance = GradeController();

  final List<Grade> _grades = [
    Grade(turma: ClassController.instance.getClasses()[0], student: StudentController.instance.getStudents()[0], grade: 70, aval: Aval.p1),
  ];

  List<Grade> getGrades(){
    List<Class> classes = ClassController.instance.getClasses();

    for(Class actualClass in classes){
      for(Grade grade in actualClass.grades){
        _grades.add(grade);
      }
    }

    return _grades;
  } 
}