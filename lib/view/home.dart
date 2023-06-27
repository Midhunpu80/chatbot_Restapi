import 'package:chat_bot/service/service.dart';
import 'package:chat_bot/view/widgets/botmesseges.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unused_field
  final List<Messege> m_essege = [];

  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onsendmessge();
  }

  onsendmessge() async {
    Messege onmessege = Messege(usertext: controller.text, is_bool: true);
    controller.clear();
    setState(() {
      m_essege.insert(0, onmessege);
    });
    // ignore: unused_local_variable
    String response = await sendMessageToChatGpt(onmessege.usertext);
    Messege chatbot = Messege(usertext: response, is_bool: false);
    setState(() {
      m_essege.insert(0, chatbot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
        actions: [
          const Icon(
            Icons.more_vert,
            color: Colors.white,
          )
        ],
        leading: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
        toolbarHeight: 100,
        elevation: 12,
        shadowColor: const Color.fromARGB(255, 243, 255, 243),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          "Mdx Bot",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 600,
            width: double.infinity,
            color: Colors.black,
            child: ListView.separated(
              reverse: true,
              itemBuilder: (context, index) {
                return botmesseges(m_essege[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: m_essege.length,
            ),
          ),
          Container(
            color: Colors.black,
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 10, left: 10),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Ask your questions.......",
                  filled: true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        onsendmessge();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Color.fromARGB(255, 0, 255, 8),
                      )),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Messege {
  final String usertext;
  final bool is_bool;
  Messege({required this.usertext, required this.is_bool});
}
