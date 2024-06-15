import 'package:flutter/material.dart';
import 'package:teach_assist_web/components/dropdown_form_field.dart';
import 'package:teach_assist_web/components/form_text_field.dart';
import 'package:teach_assist_web/components/text_button_component.dart';
import 'package:teach_assist_web/enums/aval_enum.dart';
import 'package:teach_assist_web/models/class.dart';
import 'package:teach_assist_web/models/grade.dart';
import 'package:teach_assist_web/models/student.dart';

class FormGradeClassDialog extends StatefulWidget {
  final Class actualClass;
  final Student student;
  final VoidCallback onFormSubmit;

  const FormGradeClassDialog({super.key, required this.onFormSubmit, required this.actualClass, required this.student});

  @override
  FormGradeClassDialogState createState() => FormGradeClassDialogState();
}

class FormGradeClassDialogState extends State<FormGradeClassDialog> {
  final _formKey = GlobalKey<FormState>();
  final _gradeController = TextEditingController();

  late Aval _selectedAval;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Text('Nota para ${widget.student.name}'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: DropdownFormField(
                  labelText: 'Tipo da Nota',
                  items: Aval.values.map((aval) {
                    return DropdownMenuItem(
                      value: aval,
                      child: Text(aval.displayName),
                    );
                  }).toList(),
                  onChanged: (aval) {
                    setState(() {
                      _selectedAval = aval as Aval;
                    });
                  },
                  validator: (aval) {
                    if (aval == null) {
                      return 'Por favor, selecione uma avaliação';
                    }
                    return null;
                  },
                ),
              ),
              FormTextField(
                labelText: 'Nota',
                hintText: 'Nota do Aluno',
                horizontalPadding: 0,
                inputType: TextInputType.number,
                textController: _gradeController,
                inputValidator: (grade) {
                  if (grade == null || grade.isEmpty) {
                    return 'Por favor, informe uma nota para o aluno';
                  }
                  if (double.parse(grade) < 0 || double.parse(grade) > 100) {
                    return 'Por favor, informe uma nota entre 0 e 100';
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
              Grade grade = Grade(turma: widget.actualClass, student: widget.student, grade: double.parse(_gradeController.text), aval: _selectedAval);
              widget.actualClass.grades.add(grade);
              widget.onFormSubmit();
              Navigator.of(context).pop();
            }
          },
        )
      ],
    );
  }
}
