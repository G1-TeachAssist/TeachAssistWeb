import 'package:teach_assist_web/models/discipline.dart';
import 'package:teach_assist_web/models/grade.dart';
import 'package:teach_assist_web/models/student.dart';
import 'package:teach_assist_web/models/teacher.dart';

class Class {
  final int id;
  final Teacher teacher;
  final Discipline discipline;
  final List<Student> students;
  final DateTime startAt;
  final String type;
  final String status;
  final double minFinalMedia;
  final List<Grade> grades;

  Class({
    required this.id,
    required this.teacher,
    required this.discipline,
    required this.students,
    required this.startAt,
    required this.type,
    required this.status,
    required this.minFinalMedia,
    required this.grades,
  });
}
