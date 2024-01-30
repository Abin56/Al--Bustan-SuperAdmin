import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: 500,
        width: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print("object");
                },
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: 200,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
