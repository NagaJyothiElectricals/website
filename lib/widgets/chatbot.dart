import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(ChatBotApp());

class ChatBotApp extends StatelessWidget {
  const ChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrappy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Segoe UI'),
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Center(child: ChatBotGlassBox()),
      ),
    );
  }
}

class ChatBotGlassBox extends StatefulWidget {
  const ChatBotGlassBox({super.key});

  @override
  ChatBotGlassBoxState createState() => ChatBotGlassBoxState();
}

class ChatBotGlassBoxState extends State<ChatBotGlassBox>
    with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Message> messages = [];
  bool _isTyping = false;

  final Map<String, String> knowledgeBase = {
    "hello": "Hi there! How can I help you today?",
    "how are you": "I'm just a bot, but I'm feeling great!",
    "services": "We offer electrical contracting, maintenance, and consulting.",
    "projects": "We have done 100+ projects successfully. Still counting...",
    "gallery":
        "Our Gallery will be updated regularly. You can take a look by navigating to the gallery tab.",
    "contact":
        "You can reach us at info@nagajytohielectricals.com or call +91 9666111105.",
    "bye": "Goodbye! Have a wonderful day!",
  };

  // Main suggestions shown initially
  final List<String> mainSuggestions = [
    "hello",
    "how are you",
    "services",
    "projects",
    "gallery",
    "contact",
    "bye",
  ];

  // Suggestions filtered/shown to user dynamically
  List<String> suggestions = [];

  // Colors
  final Color userBubbleStart = Color(0xFF4A90E2);
  final Color userBubbleEnd = Color(0xFF50E3C2);
  final Color botBubbleStart = Color(0xFF7B4397);
  final Color botBubbleEnd = Color(0xFFF3904F);
  final Color suggestionButtonColor = Color(0xFF9B59B6);

  @override
  void initState() {
    super.initState();
    suggestions = List.from(mainSuggestions);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startBotWelcome();
    });
  }

  void _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add(Message(text: text, isUser: true));
      _controller.clear();
      _isTyping = true;
    });

    _scrollToBottom();

    await Future.delayed(Duration(milliseconds: 700));

    String lowerText = text.toLowerCase().trim();
    String? answer;
    knowledgeBase.forEach((key, value) {
      if (lowerText.contains(key)) {
        answer = value;
      }
    });
    answer ??=
        "I'm sorry, I couldn't understand that. Please try one of the suggestions.";

    await _startTypingAnswer(answer!);

    // After response, update suggestions to relevant ones or reset to main
    _updateSuggestionsBasedOnInput(lowerText);
  }

  Future<void> _startTypingAnswer(String text) async {
    setState(() {
      messages.add(Message(text: '', isUser: false, isTyping: true));
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      messages.removeWhere((msg) => msg.isTyping);
    });

    String typedText = '';
    for (int i = 0; i < text.length; i++) {
      await Future.delayed(Duration(milliseconds: 30));
      typedText += text[i];
      setState(() {
        // Replace the typing message with current typed text
        messages.removeWhere((msg) => msg.isTyping);
        messages.add(Message(text: typedText, isUser: false, isTyping: true));
      });
      _scrollToBottom();
    }

    setState(() {
      messages.removeWhere((msg) => msg.isTyping);
      messages.add(Message(text: typedText, isUser: false));
      _isTyping = false;
    });
  }

  void _updateSuggestionsBasedOnInput(String input) {
    // If user typed a known key, show suggestions related to that key or fallback to main
    List<String> filtered = [];

    knowledgeBase.forEach((key, value) {
      if (key.contains(input) || input.contains(key)) {
        filtered.add(key);
      }
    });

    // If no filtered suggestions found, fallback to mainSuggestions
    setState(() {
      suggestions = filtered.isNotEmpty ? filtered : List.from(mainSuggestions);
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 80,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildMessageBubble(Message message) {
    final gradientUser = LinearGradient(
      colors: [userBubbleStart, userBubbleEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final gradientBot = LinearGradient(
      colors: [botBubbleStart, botBubbleEnd],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Align(
        alignment:
            message.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedOpacity(
          opacity: 1,
          duration: Duration(milliseconds: 400),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              gradient: message.isUser ? gradientUser : gradientBot,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft:
                    message.isUser ? Radius.circular(16) : Radius.circular(4),
                bottomRight:
                    message.isUser ? Radius.circular(4) : Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: (message.isUser ? userBubbleStart : botBubbleStart)
                      .withAlpha((0.5 * 255).toInt()),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child:
                message.isTyping && message.text.isEmpty
                    ? SizedBox(
                      height: 16,
                      width: 36,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Dot(), Dot(delay: 200), Dot(delay: 400)],
                      ),
                    )
                    : Text(
                      message.text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suggestions.length + 1,
        itemBuilder: (context, index) {
          if (index == suggestions.length) {
            // Last button to reset suggestions to main
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  shape: StadiumBorder(),
                  backgroundColor: Colors.grey.shade700,
                  elevation: 5,
                  shadowColor: Colors.grey.shade700.withAlpha(
                    (0.7 * 255).toInt(),
                  ),
                ),
                onPressed: () {
                  if (!_isTyping) {
                    setState(() {
                      suggestions = List.from(mainSuggestions);
                    });
                  }
                },
                child: Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }

          String suggestionText = suggestions[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                shape: StadiumBorder(),
                backgroundColor: suggestionButtonColor,
                elevation: 5,
                shadowColor: suggestionButtonColor.withAlpha(
                  (0.7 * 255).toInt(),
                ),
              ),
              onPressed: () {
                if (!_isTyping) _sendMessage(suggestionText);
              },
              child: Text(
                suggestionText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.1 * 255).toInt()),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.3 * 255).toInt()),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Type your message...",
                  hintStyle: TextStyle(color: Colors.white60),
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  if (!_isTyping) _sendMessage(value);
                },
                enabled: !_isTyping,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: _isTyping ? Colors.grey : Colors.white,
              ),
              onPressed: () {
                if (!_isTyping) _sendMessage(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _startBotWelcome() async {
    await Future.delayed(Duration(milliseconds: 400));
    await _startTypingAnswer("Hi there, how are you today?");
    await Future.delayed(Duration(milliseconds: 1000));
    await _startTypingAnswer("How can I help you?");
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          width: 360,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.1 * 255).toInt()),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withAlpha((0.25 * 255).toInt()),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.4 * 255).toInt()),
                blurRadius: 30,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Text(
                  "Scrappy Bot",
                  style: TextStyle(
                    color: Colors.white.withAlpha((0.9 * 255).toInt()),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return _buildMessageBubble(messages[index]);
                  },
                ),
              ),
              _buildSuggestions(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: _buildInputField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUser;
  final bool isTyping;

  Message({required this.text, required this.isUser, this.isTyping = false});
}

class Dot extends StatelessWidget {
  final int delay;
  const Dot({super.key, this.delay = 0});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(radius: 3, backgroundColor: Colors.white),
          ),
        );
      },
    );
  }
}
