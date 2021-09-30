import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/features/chat/chat_bloc.dart';
import 'package:flutter_projects/features/chat/show_messages.dart';
import 'package:flutter_projects/resources/firebase_helper.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatBloc chatBloc;

  @override
  void initState() {
    chatBloc = ChatBloc();
    chatBloc.currentuser();
    super.initState();
  }

  Services services = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                services.signOut(context);
              },
              icon: const Icon(Icons.logout))
        ],
        title: Text(chatBloc.loginUser!.email.toString()),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(



              color: Colors.blueAccent,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),

                  reverse: true,
                  child: Messages())),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: chatBloc.msg,
                      decoration: const InputDecoration(
                        hintText: "Enter Message",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  chatBloc.sendButton();
                },
                icon: Icon(Icons.send))
          ],
        )
      ],
    );
  }
}

// class ShowMessages extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("Messages").snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//
//
//               itemBuilder: (context,i){
//                 QueryDocumentSnapshot x = snapshot.data!.docs[i];
//                 return Text(x['message']);
//
//               });
//
//
//         });
//   }
// }
//
//
