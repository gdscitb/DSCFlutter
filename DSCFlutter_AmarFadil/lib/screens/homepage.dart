import 'package:ipcalc/models/matkul.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = context.watch<MatkulModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator IP"),
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Expanded(
            child: _MatkulList(model),
          ),
          Divider(
            height: 20,
          ),
          Text("Total SKS: ${model.totalSKS}"),
          SizedBox(height: 10),
          Text("IP: ${model.ip}"),
          SizedBox(height: 5),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/matkul/add');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class _MatkulList extends StatelessWidget {
  final MatkulModel model;
  const _MatkulList(this.model, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, idx) => Divider(),
      itemCount: model.matkul.length,
      itemBuilder: (context, idx) {
        final Matkul m = model.matkul[idx];
        return ListTile(
          leading: const Icon(Icons.book_outlined),
          trailing: Wrap(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.pushNamed(context, '/matkul/edit', arguments: m);
                },
              ),
              IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red[400],
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Hapus Matkul'),
                        content: Text(
                          'Kamu yakin ingin menghapus mata kuliah ${m.nama}?',
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Tidak'),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<MatkulModel>().removeId(m.id);
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Ya',
                              style: TextStyle(color: Colors.red[600]),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
            ],
            spacing: 10.0,
          ),
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.0,
            children: [
              Chip(
                label: Text(m.id),
                backgroundColor: Colors.cyan[300],
              ),
              Text('${m.nama} (${m.sks} SKS)'),
              Chip(
                label: Text(
                  m.verdict,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: {
                  'A': Colors.blue,
                  'AB': Colors.blueGrey,
                  'B': Colors.green,
                  'BC': Colors.lightGreen[700],
                  'C': Colors.red[300],
                  'D': Colors.red,
                  'E': Colors.black
                }[m.verdict],
              ),
            ],
          ),
        );
      },
    );
  }
}
