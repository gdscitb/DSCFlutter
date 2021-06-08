import 'package:flutter/material.dart';
import 'package:ipcalc/models/matkul.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditMatkulPage extends StatefulWidget {
  const EditMatkulPage({Key? key}) : super(key: key);

  @override
  _EditMatkulPageState createState() => _EditMatkulPageState();
}

class _EditMatkulPageState extends State<EditMatkulPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Matkul _matkul = ModalRoute.of(context)!.settings.arguments as Matkul;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Matkul"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: _matkul.id,
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
                initialValue: _matkul.nama,
                decoration: InputDecoration(labelText: "Nama Matkul"),
                onSaved: (val) {
                  setState(() {
                    _matkul.nama = val!;
                  });
                },
              ),
              TextFormField(
                initialValue: _matkul.sks.toString(),
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
                    context.read<MatkulModel>().forceUpdate();
                    Navigator.pop(context);
                  }
                },
                child: Text("Ubah"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
