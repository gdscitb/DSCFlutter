import 'package:flutter/material.dart';
import 'main.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        Card(
          child: Container(
            padding: EdgeInsets.all(15),
            child: TextBar(
                label: "Write anything...",
                icon: Icon(Icons.send)
            ),
          )
        ),

        FeedsEntry(
          author: "Alex",
          status: "Kue kue apa yang bikin bingung? gatau hehe",
          time: "5 minutes ago"
        ),
        FeedsEntry(
            author: "John",
            status: "Total 5000 jam main Tetris 👊😎",
            time: "3 hours ago"
        ),
        FeedsEntry(
            author: "Katie",
            status: "Pengen ikut Live Concert >.<",
            time: "Yesterday"
        ),
        FeedsEntry(
            author: "Alison",
            status: "Kapan kita bersama lagi 😥",
            time: "4 days ago"
        ),

      ],
    );
  }
}

class FeedsEntry extends StatefulWidget {
  final String author, status, time;
  FeedsEntry({this.author, this.status, this.time});
  @override
  _FeedsEntry createState() => _FeedsEntry(author: author, status: status, time: time);
}

class _FeedsEntry extends State<FeedsEntry> {
  final String author, status, time;
  _FeedsEntry({this.author, this.status, this.time});

  bool liked = false;

  @override
  Widget build(BuildContext context) {

    void liking() {
      setState(() {
        liked = !liked;
      });
    }

    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
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
                          Text("$author", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Text("$time")
                ],
              ),
            ),

            SizedBox(height: 15),

            Text(
              "$status",
              style: TextStyle(
                fontSize: 15
              ),
            ),

            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: liking,
                  icon: Icon(Icons.thumb_up),
                  color: liked? Colors.deepPurple: Colors.grey,
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.chat),
                  color: Colors.grey,
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.share),
                  color: Colors.grey,
                ),
              ],
            )

          ],
        ),
      )
    );
  }
}
