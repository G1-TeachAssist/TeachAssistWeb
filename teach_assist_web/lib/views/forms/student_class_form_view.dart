import 'package:flutter/material.dart';
import 'package:teach_assist_web/components/dropdown_form_field.dart';
import 'package:teach_assist_web/components/text_button_component.dart';
import 'package:teach_assist_web/controllers/student_controller.dart';
import 'package:teach_assist_web/models/class.dart';
import 'package:teach_assist_web/models/student.dart';

class FormStudentClassDialog extends StatefulWidget {
  final Class actualClass;
  final VoidCallback onFormSubmit;

  const FormStudentClassDialog({super.key, required this.onFormSubmit, required this.actualClass});

  @override
  FormStudentClassDialogState createState() => FormStudentClassDialogState();
}

class FormStudentClassDialogState extends State<FormStudentClassDialog> {
  final _formKey = GlobalKey<FormState>();
  
  late List<Student> _students;
  late List<Student> _allStudents;
  late Student _selectedStudent;

  @override
  void initState() {
    super.initState();
    _students = [];
    _allStudents = StudentController.instance.getStudents();
    for(Student student in _allStudents){
      if(!widget.actualClass.students.contains(student)){
        _students.add(student);
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: const Text('Adicionar Aluno na Turma'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: DropdownFormField(
                  labelText: 'Aluno',
                  items: _students.map((student) {
                    return DropdownMenuItem(
                      value: student,
                      child: Text(student.name),
                    );
                  }).toList(),
                  onChanged: (student) {
                    setState(() {
                      _selectedStudent = student as Student;
                    });
                  },
                  validator: (student) {
                    if (student == null) {
                      return 'Por favor, selecione um aluno';
                    }
                    return null;
                  },
                ),
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
              widget.actualClass.students.add(_selectedStudent);
              widget.onFormSubmit();
              Navigator.of(context).pop();
            }
          },
        )
      ],
    );
  }
}
