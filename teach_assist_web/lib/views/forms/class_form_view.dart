import 'package:flutter/material.dart';
import 'package:teach_assist_web/components/dropdown_form_field.dart';
import 'package:teach_assist_web/components/form_text_field.dart';
import 'package:teach_assist_web/components/text_button_component.dart';
import 'package:teach_assist_web/controllers/discipline_controller.dart';
import 'package:teach_assist_web/controllers/teacher_controller.dart';
import 'package:teach_assist_web/models/discipline.dart';
import 'package:teach_assist_web/models/teacher.dart';

class FormClassDialog extends StatefulWidget {
  //final VoidCallback onFormSubmit;

  const FormClassDialog({super.key});

  @override
  FormClassDialogState createState() => FormClassDialogState();
}

class FormClassDialogState extends State<FormClassDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  
  late List<Discipline> _disciplines;
  Discipline? _selectedDiscipline;

  late List<Teacher> _teachers;
  Teacher? _selectedTeacher;

  @override
  void initState() {
    super.initState();
    _disciplines = DisciplineController.instance.getDisciplines();
    _teachers = TeacherController.instance.getTeachers();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context, 
      firstDate: DateTime.now(),
      initialDate: DateTime.now(), 
      lastDate: DateTime(2101),
    );
    if(picked != null){
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
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
              )
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
              //widget.onFormSubmit();
              Navigator.of(context).pop();
              print(_selectedDiscipline!.name);
              print(_selectedTeacher!.name);
            }
          },
        ),
      ],
    );
  }
}
