import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderTuto extends StatefulWidget {
  const FormBuilderTuto({super.key});

  @override
  State<FormBuilderTuto> createState() => _FormBuilderTutoState();
}

class _FormBuilderTutoState extends State<FormBuilderTuto> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter_form_builder Widget"),
      ),
      body: FormBuilder(
        key: _formKey,
        child: FormBuilderTextField(
          name: 'text',
          onChanged: (value) => print(value),
        ),
      ),
    );
    // https://pub.dev/packages/flutter_form_builder
  }
}
