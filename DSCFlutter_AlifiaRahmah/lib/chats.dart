import 'package:flutter/material.dart';
import 'package:dscflutter_alifiarahmah/main.dart';

// ChatList: konten list chat habis klik dari navbar datengnya ke sini
class ChatList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextBar(
          label: 'Search',
          icon: Icon(Icons.search)
        ),

        Expanded(
          child: ListView(
            children: [
              ChatHeader(from: "Alex", desc: "Long time no see, dude", time: "11:10"),
              ChatHeader(from: "John", desc: "How's day?", time: "10:10"),
              ChatHeader(from: "Melinda", desc: "What are you doing this time?", time: "03:00"),
            ]
          ),
        )

      ],
    );
  }
}

class ChatHeader extends StatelessWidget{
  final String from, desc, time;

  ChatHeader({this.from, this.desc, this.time});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(name: "$from", lastchat: "$desc"))),
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
                    Text("$from", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                    Text("$desc")
                  ],
                ),
              ),
            ),

            Text("$time")

          ],

        ),
      )
    );
  }
}

class ChatMessage{
  String messageContent, messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}

class ChatScreen extends StatefulWidget{

  final String name, lastchat;
  ChatScreen({this.name, this.lastchat});

  @override
  _ChatScreen createState() => _ChatScreen(name: this.name, lastchat: this.lastchat);
}

class _ChatScreen extends State<ChatScreen>{
  final String name, lastchat;
  _ChatScreen({this.name, this.lastchat});
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hi!", messageType: "receiver"),
    ChatMessage(messageContent: "Hello!", messageType: "sender"),
  ];

  // text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(left: 20),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios,color: Colors.white),
                ),
                SizedBox(width: 2,),
                CircleAvatar(backgroundColor: Colors.deepPurpleAccent, child: Icon(Icons.person)),
                SizedBox(width: 12,),
                Expanded(
                  child: InkWell(
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MemberProfile()));},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("$name",style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600, color: Colors.white)),
                        Text("Online",style: TextStyle(color: Colors.white, fontSize: 13),),
                      ],
                    ),
                  )
                ),
                IconButton(icon: Icon(Icons.more_vert,color: Colors.white), onPressed: (){},),
              ],
            ),
          ),
        ),
      ),

      body: Stack(
        children: <Widget>[

          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: messages.length+1,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i){
              if (i < messages.length) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[i].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // bgcolors chat bubble
                        color: (messages[i].messageType == "receiver" ? Colors
                            .deepPurpleAccent : Colors.white),
                      ),
                      padding: EdgeInsets.all(8),
                      // txtcolor chat bubble
                      child: Text(
                        messages[i].messageContent,
                        style: TextStyle(fontSize: 15, color: (messages[i]
                            .messageType == "receiver" ? Colors.white : Colors
                            .black)),
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // bgcolors chat bubble
                        color: Colors.deepPurpleAccent,
                      ),
                      padding: EdgeInsets.all(8),
                      // txtcolor chat bubble
                      child: Text(
                        "$lastchat",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                );
              }
            }
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Expanded(
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        //hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),

                  SizedBox(width: 15),

                  IconButton(
                    onPressed: () {
                      if (myController.text.length != 0) {
                        messages.add(ChatMessage(messageContent: myController.text, messageType: "sender"));
                        setState(() {});
                        myController.text = '';
                      }
                    },
                    icon: Icon(Icons.send,color: Colors.deepPurple)
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}