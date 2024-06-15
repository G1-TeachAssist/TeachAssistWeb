import 'package:teach_assist_web/models/discipline.dart';

class DisciplineController {
  static final DisciplineController instance = DisciplineController();

  final List<Discipline> _disciplines = [
    Discipline(id: 1, code: 'BIO01', name: 'Biologia'),
    Discipline(id: 2, code: 'MAT01', name: 'Matemática'),
    Discipline(id: 3, code: 'POR01', name: 'Português'),
  ];

  List<Discipline> getDisciplines() {
    return _disciplines;
  }

  void addDiscipline(String code, String name) {
    Discipline discipline = Discipline(id: 53, code: code, name: name);
    getDisciplines().add(discipline);
  }
}
