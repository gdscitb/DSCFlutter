import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:dscflutter_alifiarahmah/main.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TextBar(
            label: 'Search',
            icon: Icon(Icons.search)
        ),

        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index){
              return ProfileHeader(name: faker.person.name());
            },
          ),
        )

      ],
    );
  }
}

class ProfileHeader extends StatelessWidget{
  final String name;
  ProfileHeader({this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Icon(Icons.person)
              ),

              SizedBox(width: 18),

              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                    ],
                  ),
                ),
              ),

            ],

          ),
        )
    );
  }
}