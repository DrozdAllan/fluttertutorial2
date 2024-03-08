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
        // always : already displays errors (works only inside each Fields of the form, not in FormBuilder)
        // disabled : only show errors when trying to validate the form (on submit)
        // onUserInteraction : display all errors as soon as the user enter any field of the form
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'text',
              onChanged: (value) => print(value),
            ),
            FormBuilderChoiceChip(
              name: 'choice_chip',
              decoration: const InputDecoration(
                labelText: 'ChoiceChip',
              ),
              options: const [
                FormBuilderChipOption(value: 'Test 1', child: Text('Test 1')),
                FormBuilderChipOption(value: 'Test 2', child: Text('Test 2')),
              ],
            ),
            FormBuilderDateTimePicker(
              name: 'date',
              // onChanged: _onChanged,
              inputType: InputType.both,
              // or InputType.time or InputType.date
              decoration: const InputDecoration(
                labelText: 'DateTimePicker',
              ),
              initialTime: const TimeOfDay(hour: 8, minute: 0),
              // initialValue: DateTime.now(),
              enabled: false,
            ),
          ],
        ),
      ),
    );
    // https://pub.dev/packages/flutter_form_builder
  }
}
