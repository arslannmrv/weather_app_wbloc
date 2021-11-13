import 'package:flutter/material.dart';

class ChooseCityWidget extends StatefulWidget {
  const ChooseCityWidget({Key? key}) : super(key: key);

  @override
  _ChooseCityWidgetState createState() => _ChooseCityWidgetState();
}

class _ChooseCityWidgetState extends State<ChooseCityWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose City"),
      ),
      body: Form(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: "City",
                  hintText: "Choose City",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pop(context,
                  _textController.text); //Geldiğimiz sayfaya geri döneriz.
            },
          )
        ],
      )),
    );
  }
}
