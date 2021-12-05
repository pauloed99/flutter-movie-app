import 'package:flutter/material.dart';
import 'package:movies_app/app/views/widgets/custom.text.widget.dart';

class MoviesSearchPage extends StatelessWidget {
  const MoviesSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          text: 'Movies Search',
          fontSize: width * .055,
          color: Colors.white,
        ),
      ),
    );
  }
}
