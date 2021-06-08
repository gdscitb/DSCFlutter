import 'package:ipcalc/models/matkul.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMatkulPage extends StatefulWidget {
  const AddMatkulPage({Key? key}) : super(key: key);

  @override
  _AddMatkulPageState createState() => _AddMatkulPageState();
}

class _AddMatkulPageState extends State<AddMatkulPage> {
  final _formKey = GlobalKey<FormState>();
  Matkul _matkul = Matkul("", "", 0);
  bool isUsingGradebook = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tambah Matkul"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "ID Matkul",
                    hintText: "e.g. IF1201 (Dasar Pemograman)",
                  ),
                  onSaved: (val) {
                    setState(() {
                      _matkul.id = val!;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Nama Matkul"),
                  onSaved: (val) {
                    setState(() {
                      _matkul.nama = val!;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "SKS"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onSaved: (val) {
                    setState(() {
                      _matkul.sks = int.parse(val!);
                    });
                  },
                ),
                Row(
                  children: [
                    Text("Nilai Akhir"),
                    DropdownButton<String>(
                        value: _matkul.verdict,
                        onChanged: (val) {
                          setState(() {
                            _matkul.verdict = val!;
                          });
                        },
                        items: ['A', 'AB', 'B', 'BC', 'C', 'D', 'E']
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList())
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      context.read<MatkulModel>().add(_matkul);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Tambah"),
                ),
              ],
            ),
          ),
        ));
  }
}
