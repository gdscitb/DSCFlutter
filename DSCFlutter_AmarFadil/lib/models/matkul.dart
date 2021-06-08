import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Matkul {
  String id;
  String nama;
  int sks;
  String? _verdict;

  set verdict(String newVerdict) {
    _verdict = newVerdict;
  }

  String get verdict {
    return _verdict!;
  }

  Matkul(this.id, this.nama, this.sks, {String verdict = "A"}) {
    this.verdict = verdict;
  }

  factory Matkul.fromJson(Map<String, dynamic> jsonData) {
    return Matkul(
      jsonData["id"],
      jsonData["nama"],
      jsonData["sks"],
      verdict: jsonData["verdict"],
    );
  }

  static Map<String, dynamic> toMap(Matkul matkul) => {
        "id": matkul.id,
        "nama": matkul.nama,
        "sks": matkul.sks,
        "verdict": matkul.verdict
      };

  static String encode(List<Matkul> matkul) => json.encode(
        matkul
            .map(
              (e) => Matkul.toMap(e),
            )
            .toList(),
      );
  static List<Matkul> decode(String matkul) =>
      (json.decode(matkul) as List<dynamic>)
          .map(
            (e) => Matkul.fromJson(e),
          )
          .toList();
}

class MatkulModel extends ChangeNotifier {
  static List<Matkul> _matkul = <Matkul>[];
  List<Matkul> get matkul => _matkul;
  void add(Matkul matkul) async {
    _matkul.add(matkul);
    save();
    notifyListeners();
  }

  void update(Matkul matkul) async {
    int idx = _matkul.indexWhere((element) => element.id == matkul.id);
    _matkul[idx] = matkul;
    save();
    notifyListeners();
  }

  void forceUpdate() async {
    save();
    notifyListeners();
  }

  void removeId(String id) {
    _matkul.removeWhere((element) => element.id == id);
    save();
    notifyListeners();
  }

  void save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("data", Matkul.encode(_matkul));
  }

  void load() async {
    final prefs = await SharedPreferences.getInstance();
    _matkul = Matkul.decode(prefs.getString("data") ?? "[]");
    notifyListeners();
  }

  int get totalSKS {
    return _matkul.fold<int>(0, (prev, c) => prev + c.sks);
  }

  double get ip {
    const mapping = {
      'A': 4.0,
      'AB': 3.5,
      'B': 3.0,
      'BC': 2.5,
      'C': 2.0,
      'D': 1.0,
      'E': 0.0,
    };
    final sks = totalSKS;
    if (sks == 0) {
      return 0;
    }
    return _matkul.fold<double>(
          0,
          (prev, c) => prev + (mapping[c.verdict] ?? 0.0) * c.sks,
        ) /
        sks;
  }
}
