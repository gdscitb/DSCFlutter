import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      SettingsEntry(text: "Edit Profile"),
      SettingsEntry(text: "Account"),
      SettingsEntry(text: "Appearance"),
      SettingsEntry(text: "Privacy"),
      SettingsEntry(text: "Notifications"),
      SettingsEntry(text: "Language"),

      Expanded(child: SizedBox()),

      Logout()

      ],
    );
  }
}

class SettingsEntry extends StatelessWidget {
  final String text;
  SettingsEntry({this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "$text",
                  style: TextStyle(
                    fontSize: 16,
                  )
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        )
    );
  }
}

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.logout, color: Colors.red,),
              SizedBox(width: 5),
              Text(
                  "Log Out",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.red
                  )
              )
            ],
          ),
        )
    );
  }
}