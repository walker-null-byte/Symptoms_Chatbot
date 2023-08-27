import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'ChatBotController.dart';
import 'ChatBubble.dart';
import 'MessageBox.dart';
import 'package:get/get.dart';

class ChatBot extends GetView<ChatBotController> {
  final ChatBotController chat_controller = Get.put(ChatBotController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff40e0d0),
          title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    print("TODO");
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 25
                  ),
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/jeevan.jpg'),
                ),
                SizedBox(width: 15),
                Text('Jeevan'),
              ]
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Obx(
                    () => SingleChildScrollView(
                  controller: chat_controller.scrollController,
                  dragStartBehavior: DragStartBehavior.down,
                  child: ListView.builder(
                    itemCount: chat_controller.messages.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        message: chat_controller.messages[index]['message'],
                        dateTime: chat_controller.messages[index]['dateTime'],
                        isMe: chat_controller.messages[index]['isMe'],
                      );
                    },
                  ),
                ),
              ),
            ),
            MessageBox(chat_controller: chat_controller,),
          ],
        ),
      ),
    );
  }
}
