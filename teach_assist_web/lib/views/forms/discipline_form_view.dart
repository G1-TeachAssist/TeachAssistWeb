import 'package:flutter/material.dart';

class FormDialog extends StatefulWidget {
  const FormDialog({super.key});

  @override
  FormDialogState createState() => FormDialogState();
}

class FormDialogState extends State<FormDialog> {
  final _formKey = GlobalKey<FormState>();
  String _code = '';
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFf5f6fa),
      title: const Text('Inserir Nova Disciplina'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Código'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _code = value!;
                  },
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Salvar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              //print('Nome: $_code, E-mail: $_name');
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}

