import 'package:flutter/material.dart';
import 'package:news_app/data/preferences/preferences_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Consumer<PreferencesProvider>(
        builder: (context, provider, _) {
          return ListView(
            children: [
              Material(
                child: ListTile(
                  title: Text("Dark Theme"),
                  trailing: Switch.adaptive(
                    value: provider.isDarkTheme,
                    onChanged: (value) {
                      provider.enableDarkTheme(value);
                    }
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
