import 'package:chat_gpt/suggetion_box.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_gpt/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black87, Colors.deepPurple],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, size: 32),
            onPressed: () {},
          ),
          title: const Text(
            "BROXI AI",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/bot.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "Hi, how can I assist you today?",
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Explore the possibilities:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SuggestionBox(
                  header: "Quick Insights",
                  body: "Get instant answers to your questions.",
                  color: Colors.orangeAccent,
                ),
                const SuggestionBox(
                  header: "Advanced AI",
                  body: "Experience cutting-edge conversational AI.",
                  color: Colors.blueAccent,
                ),
                const SuggestionBox(
                  header: "Lightning Speed",
                  body: "Enjoy quick and precise responses.",
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
          },
          backgroundColor: Colors.white,
          child: Image.asset(
            "assets/images/gpt.png",
            width: 30,
          ),
        ),
      ),
    );
  }
}
