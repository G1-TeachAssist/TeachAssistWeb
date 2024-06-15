import 'package:teach_assist_web/enums/aval_enum.dart';
import 'package:teach_assist_web/models/class.dart';
import 'package:teach_assist_web/models/student.dart';

class Grade {
  final Class turma;
  final Student student;
  final double grade;
  final Aval aval;

  Grade({
    required this.turma,
    required this.student,
    required this.grade,
    required this.aval,
  });
}
