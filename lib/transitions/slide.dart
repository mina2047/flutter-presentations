import 'package:animation_cheat_page/shared/material_import.dart';

class SlideExample extends StatefulWidget {
  @override
  _SlideExampleState createState() => _SlideExampleState();
}

class _SlideExampleState extends State<SlideExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: null,
    );
  }
}
