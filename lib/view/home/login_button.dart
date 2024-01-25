import 'package:flutter/material.dart';

class MyHoverContainer extends StatefulWidget {
  const MyHoverContainer({super.key});

  @override
  _MyHoverContainerState createState() => _MyHoverContainerState();
}

class _MyHoverContainerState extends State<MyHoverContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: SizedBox(
        height: 200,
        width: 200,
        child: MouseRegion(
          onEnter: (_) => _mouseEnter(true),
          onExit: (_) => _mouseEnter(false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 200,
            height: 200,
            color: isHovered ? Colors.blue : Colors.green,
            child: const Center(
              child: Text(
                'Hover me!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    print("object");
    setState(() {
      isHovered = hover;
    });
  }
}
