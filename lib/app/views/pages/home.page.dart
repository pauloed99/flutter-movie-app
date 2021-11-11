import 'package:flutter/material.dart';
import 'package:movies_app/app/views/widgets/custom.text.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: 'Home',
          color: Colors.white,
        ),
      ),
      body: Container(),
    );
  }
}
