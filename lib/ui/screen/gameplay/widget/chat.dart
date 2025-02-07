import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  final VoidCallback onMessageSent;

  ChatWidget({required this.onMessageSent});

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _messageSent = false;

  void _sendMessage(String message) {
    setState(() {
      _messages.add({
        'user': 'Player 1', // POV player 1
        'message': message,
        'color': Colors.red, // Warna merah untuk player 1
      });
      _controller.clear();
      _messageSent = true;
    });
    widget.onMessageSent(); 
  }

  void _resetChat() {
    setState(() {
      _messages.clear();
      _messageSent = false;
    });
  }

  void _handleButtonPress() {
    setState(() {
      _messageSent = false;
    });
    widget.onMessageSent();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, 
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: message['color'], 
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        message['message']!,
                        style: const TextStyle(
                          color: Colors.white, 
                          fontSize: 20,
                          fontFamily: 'Typography',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _messageSent
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _sendMessage('Ya');
                        _handleButtonPress();
                      },
                      child: Image.asset(
                        'assets/ya.png',
                        width: 110,
                        height: 50,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _sendMessage('Tidak');
                        _handleButtonPress();
                      },
                      child: Image.asset(
                        'assets/tidak.png',
                        width: 110,
                        height: 50,
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: const Color(0xFED8B180),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () => _sendMessage(_controller.text),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Typography',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF6F4E37),
                        ),
                        onSubmitted: (value) => _sendMessage(value),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}