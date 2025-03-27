import 'package:driftexample/db/tables/items/chat_message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'db/services/user_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserService userService = UserService();

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drift Singleton Example',
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(title: const Text('Drift DB Example')),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: userService.listenMessages(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Column(
                    children: [
                      SizedBox(height: 60,),
                      Icon(Icons.chat,size: 50,),
                      Text("No messages yet, please send a message")
                    ],
                  );
                  }
                  final List<ChatMessage> messages  = (snapshot.data)??[];
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(messages[index].newMessage??"Null"),
                        subtitle: Text(messages[index].senderId??"Null"),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom,right: 16,left: 16),
              child: SizedBox(
                height: 60,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: CupertinoTextField(controller: controller)),
                        IconButton(
                            onPressed: () {
                              final text = controller.text;
                              if (text.isNotEmpty) {
                                final message = ChatMessage.createLocal(
                                    roomId: "Simon${DateTime.now().toIso8601String()}",
                                    senderId: "Simon",
                                    newMessage: text);
                                controller.text="";
                                userService.insertMessages(message);
                              }
                            },
                            icon: Icon(Icons.send))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),


      ),
    );
  }
}
