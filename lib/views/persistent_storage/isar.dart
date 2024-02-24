import 'package:flutter/material.dart';
import 'package:fluttertutorial2/data/dataproviders/isar_box.dart';
import 'package:fluttertutorial2/data/models/cat/cat.dart';

class IsarTuto extends StatefulWidget {
  const IsarTuto({super.key});

  @override
  State<IsarTuto> createState() => _IsarTutoState();
}

class _IsarTutoState extends State<IsarTuto> {
  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey<FormFieldState>();
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const Text('Salut ici c\'est Isar'),
        SizedBox(
          height: 350.0,
          child: FutureBuilder(
            future: IsarBox.getCats(),
            // future: IsarBox.getCat(1),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('Loading...'),
                );
              }
              return snapshot.data!.isEmpty
                  ? const Center(
                      child: Text('No cats'),
                    )
                  : ListView(
                      children: snapshot.data!
                          .map(
                            (cat) => Center(
                              child: ListTile(
                                title: Text(cat!.name),
                                onTap: () => remove(cat.id),
                              ),
                            ),
                          )
                          .toList(),
                    );
            },
          ),
        ),
        const Text("Add a Cat"),
        TextFormField(
          key: _formFieldKey,
          controller: _name,
          textAlign: TextAlign.start,
          decoration: const InputDecoration(
              label: Center(child: Text('Name')), border: OutlineInputBorder()),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
        OutlinedButton(
            onPressed: () {
              addToBox();
            },
            child: const Text("Add"))
      ]),
    );
  }

  addToBox() {
    // add new entry to box
    IsarBox.addCat(Cat(name: _name.value.text, age: 28));
    setState(() {
      _name.clear();
    });
  }

  remove(int id) {
    IsarBox.deleteCat(id);
    setState(() {/* the Future<List<Cat?>> has been updated */});
  }
}
