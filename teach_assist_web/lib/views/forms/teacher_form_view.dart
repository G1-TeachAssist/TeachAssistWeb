import 'package:flutter/material.dart';
import 'package:teach_assist_web/components/form_text_field.dart';
import 'package:teach_assist_web/components/text_button_component.dart';

class FormTeacherDialog extends StatefulWidget {
  const FormTeacherDialog({super.key});

  @override
  FormTeacherDialogState createState() => FormTeacherDialogState();
}

class FormTeacherDialogState extends State<FormTeacherDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Cadastro de Professor'),
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
                  hintText: 'Nome do professor',
                  horizontalPadding: 0,
                  inputType: TextInputType.text,
                  textController: _nameController,
                  inputValidator: (name) {
                    if (name == null || name.isEmpty) {
                      return "Por favor, preencha o nome do professor";
                    }
                    return null;
                  },
                ),
              ),
              FormTextField(
                labelText: 'E-mail',
                hintText: 'E-mail do professor',
                horizontalPadding: 0,
                textController: _emailController,
                inputType: TextInputType.emailAddress,
                inputValidator: (code) {
                  if (code == null || code.isEmpty) {
                    return "Por favor, preencha o e-mail do professor";
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
            if (_formKey.currentState!.validate()) {}
          },
        )
      ],
    );
  }
}
