import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messages = [];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _topChat(),
                _bodyChat(),
                SizedBox(
                  height: 120,
                )
              ],
            ),
            _formChat(),
          ],
        ),
      ),
    );
  }

  _topChat() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Chat',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return MessageBubble(
                isResponse: message.isResponse,
                message: message.message,
                senderName: message.isResponse ? 'Chat' : 'You',
              );
            }),
      ),
    );
  }

  Widget _formChat() {
  return Positioned(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        color: Colors.white,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Digite sua mensagem...',
            suffixIcon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.indigo),
              padding: EdgeInsets.all(12),
              child: IconButton(
                icon: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () async {
                  await sendQuestion();
                },
              ),
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color:
                      const Color.fromARGB(255, 236, 239, 241)),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color:
                      const Color.fromARGB(255, 233, 237, 239)),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onSubmitted:(value) async {
            await sendQuestion();
          },
        ),
      ),
    ),
  );
}

  Future<void> sendQuestion() async {
    if (controller.text.isEmpty) return;
    final question = controller.text;
    controller.text = '';
    setState(() {
      messages.add(Message(isResponse: false, message: question));
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      messages.add(Message(isResponse: true, message: ''));
    });
    await Future.delayed(const Duration(milliseconds: 500));

    final response = (await getChatResponse(question: question)).trim();

    setState(() {
      messages[messages.length - 1].message = response;
    });
  }
}

class Message {
  Message({
    required this.isResponse,
    required this.message,
  });
  final bool isResponse;
  String message;
}

class MessageBubble extends StatelessWidget {
  final String message;
  final String senderName;
  final bool isResponse;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.senderName,
    required this.isResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sharpEdge = Radius.circular(0);
    const roundedEdge = Radius.circular(16);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isResponse ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isResponse ? const CircleAvatar() : const SizedBox(),
        const SizedBox(width: 6.0),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: isResponse ? Colors.grey.shade200 : Colors.green.shade200,
            borderRadius: BorderRadius.only(
              topLeft: roundedEdge,
              topRight: roundedEdge,
              bottomLeft: isResponse ? sharpEdge : roundedEdge,
              bottomRight: isResponse ? roundedEdge : sharpEdge,
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(senderName,
                style: TextStyle(
                    color: Colors.grey.shade800, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            if (message.isEmpty)
              const Row(children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator.adaptive()),
                SizedBox(height: 16),
                Text('Chat está digitando ...')
              ])
            else
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(message,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 16))),
          ]),
        )
      ],
    );
  }
}

Future<String> getChatResponse({required String question}) async {
  const apiURL = 'http://localhost:3001';
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final requestBody = json.encode({
    'message': question,
  });

  final response = await http.post(
    Uri.parse(apiURL),
    headers: headers,
    body: requestBody,
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    return 'Failed to connect to the API.';
  }
}
