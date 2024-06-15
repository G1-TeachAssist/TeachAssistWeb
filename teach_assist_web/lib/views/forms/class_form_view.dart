import 'package:flutter/material.dart';
import 'package:teach_assist_web/components/dropdown_form_field.dart';
import 'package:teach_assist_web/components/form_text_field.dart';
import 'package:teach_assist_web/components/text_button_component.dart';
import 'package:teach_assist_web/controllers/class_controller.dart';
import 'package:teach_assist_web/controllers/discipline_controller.dart';
import 'package:teach_assist_web/controllers/teacher_controller.dart';
import 'package:teach_assist_web/models/class.dart';
import 'package:teach_assist_web/models/discipline.dart';
import 'package:teach_assist_web/models/teacher.dart';
import 'package:teach_assist_web/utils/services.dart';

class FormClassDialog extends StatefulWidget {
  final VoidCallback onFormSubmit;

  const FormClassDialog({super.key, required this.onFormSubmit});

  @override
  FormClassDialogState createState() => FormClassDialogState();
}

class FormClassDialogState extends State<FormClassDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _minFinalMediaController =
      TextEditingController();

  late List<Discipline> _disciplines;
  Discipline? _selectedDiscipline;

  late List<Teacher> _teachers;
  Teacher? _selectedTeacher;

  late DateTime? _selectedDate;

  late List _type;
  String? _selectedType;

  late List _status;
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _disciplines = DisciplineController.instance.getDisciplines();
    _teachers = TeacherController.instance.getTeachers();
    _type = ['Mensal', 'Bimestral', 'Trimestral', 'Semestral', 'Anual'];
    _status = ['Em andamento', 'Notas pendentes', 'Finalizada'];
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    _selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (_selectedDate  != null) {
      setState(() {
        _dateController.text = Services.instance.convertDateToString(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: const Text('Cadastro de Turma'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: FormTextField(
                  labelText: 'ID',
                  hintText: 'ID da Turma',
                  horizontalPadding: 0,
                  inputType: TextInputType.text,
                  textController: _idController,
                  inputValidator: (id) {
                    if (id == null || id.isEmpty) {
                      return 'Por favor, informe o identificador da turma';
                    }
                    return null;
                  },
                ),
              ),
              DropdownFormField(
                labelText: 'Professor',
                items: _teachers.map((teacher) {
                  return DropdownMenuItem(
                    value: teacher,
                    child: Text(teacher.name),
                  );
                }).toList(),
                onChanged: (teacher) {
                  setState(() {
                    _selectedTeacher = teacher! as Teacher?;
                  });
                },
                validator: (teacher) {
                  if (teacher == null) {
                    return 'Por favor, selecione um professor';
                  }
                  return null;
                },
              ),
              DropdownFormField(
                labelText: 'Disciplina',
                items: _disciplines.map((discipline) {
                  return DropdownMenuItem(
                    value: discipline,
                    child: Text(discipline.name),
                  );
                }).toList(),
                onChanged: (discipline) {
                  setState(() {
                    _selectedDiscipline = discipline! as Discipline?;
                  });
                },
                validator: (discipline) {
                  if (discipline == null) {
                    return 'Por favor, selecione uma disciplina';
                  }
                  return null;
                },
              ),
              FormTextField(
                labelText: 'Início da Disciplina',
                hintText: 'Início da Disciplina',
                horizontalPadding: 0,
                textController: _dateController,
                onTap: () => _selectDate(context),
                inputValidator: (date) {
                  if (date == null || date.isEmpty) {
                    return 'Por favor, selecione uma data de início';
                  }
                  return null;
                },
              ),
              DropdownFormField(
                labelText: 'Tipo',
                items: _type.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (type) {
                  setState(() {
                    _selectedType = type as String?;
                  });
                },
                validator: (type) {
                  if (type == null) {
                    return 'Por favor, selecione um tipo';
                  }
                  return null;
                },
              ),
              DropdownFormField(
                labelText: 'Status',
                items: _status.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (status) {
                  setState(() {
                    _selectedStatus = status as String?;
                  });
                },
                validator: (status) {
                  if (status == null) {
                    return 'Por favor, selecione um status';
                  }
                  return null;
                },
              ),
              FormTextField(
                labelText: 'Média Final Mínima',
                hintText: 'Média Final Mínima',
                horizontalPadding: 0,
                inputType: TextInputType.number,
                textController: _minFinalMediaController,
                inputValidator: (media) {
                  if (media == null || media.isEmpty) {
                    return 'Por favor, informe a média mínima da turma';
                  }
                  if (double.parse(media) < 1 || double.parse(media) > 100) {
                    return 'Por favor, informe uma média entre 1 e 100';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        popupButton(
          buttonColor: const Color(0xFFC9CBD2),
          buttonText: 'Cancelar',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        popupButton(
          buttonColor: const Color(0xFF44bd32),
          buttonText: 'Salvar',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Class newClass = Class(
                id: int.parse(_idController.text),
                teacher: _selectedTeacher!,
                discipline: _selectedDiscipline!,
                students: [],
                grades: [],
                startAt: _selectedDate!,
                type: _selectedType!,
                status: _selectedStatus!,
                minFinalMedia: double.parse(_minFinalMediaController.text),
              );
              ClassController.instance.addClass(newClass);
              widget.onFormSubmit();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
