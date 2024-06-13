import 'package:flutter/material.dart';
import 'package:teach_assist_web/components/form_text_field.dart';
import 'package:teach_assist_web/components/text_button_component.dart';
import 'package:teach_assist_web/controllers/discipline_controller.dart';

class FormDisciplineDialog extends StatefulWidget {
  final VoidCallback onFormSubmit;

  const FormDisciplineDialog({super.key, required this.onFormSubmit});

  @override
  FormDisciplineDialogState createState() => FormDisciplineDialogState();
}

class FormDisciplineDialogState extends State<FormDisciplineDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: const Text('Cadastro de Disciplina'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: FormTextField(
                  labelText: 'Código',
                  hintText: 'Código da disciplina',
                  horizontalPadding: 0,
                  textController: _codeController,
                  inputType: TextInputType.text,
                  inputValidator: (code) {
                    if (code == null || code.isEmpty) {
                      return "Por favor, preencha o código da disciplina";
                    }
                    return null;
                  },
                ),
              ),
              FormTextField(
                labelText: 'Nome',
                hintText: 'Nome da disciplina',
                horizontalPadding: 0,
                inputType: TextInputType.text,
                textController: _nameController,
                inputValidator: (name) {
                  if (name == null || name.isEmpty) {
                      return "Por favor, preencha o nome da disciplina";
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
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        popupButton(
          buttonColor: const Color(0xFF44bd32),
          buttonText: 'Salvar',
          onPressed: (){
            if(_formKey.currentState!.validate()){
              DisciplineController.instance.addDiscipline(_codeController.text, _nameController.text);
              widget.onFormSubmit();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
