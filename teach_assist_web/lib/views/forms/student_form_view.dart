import 'package:flutter/material.dart';
import 'package:teach_assist_web/components/form_text_field.dart';
import 'package:teach_assist_web/components/text_button_component.dart';

class FormStudentDialog extends StatefulWidget {
  const FormStudentDialog({super.key});

  @override
  FormStudentDialogState createState() => FormStudentDialogState();
}

class FormStudentDialogState extends State<FormStudentDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Cadastro de Aluno'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: FormTextField(
                  labelText: 'Nome',
                  hintText: 'Nome do aluno',
                  horizontalPadding: 0,
                  inputType: TextInputType.text,
                  textController: _nameController,
                  inputValidator: (name) {
                    if (name == null || name.isEmpty) {
                      return "Por favor, preencha o nome do aluno";
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
            if (_formKey.currentState!.validate()) {}
          },
        )
      ],
    );
  }
}
