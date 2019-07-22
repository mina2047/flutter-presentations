import 'package:animation_cheat_page/shared/frame.dart';
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/transitions/scale.dart';
import 'package:animation_cheat_page/transitions/slide.dart';

class AnimationCheatSheet extends StatelessWidget {
  const AnimationCheatSheet({Key key}) : super(key: key);

  static final GlobalKey gKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: gKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: const _PresentationList(),
    );
  }
}

class _PresentationList extends StatelessWidget {
  const _PresentationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const _AnimationProvider(),
    );
  }
}

class _AnimationProvider extends StatefulWidget {
  const _AnimationProvider({Key key}) : super(key: key);

  @override
  __AnimationProviderState createState() => __AnimationProviderState();
}

class __AnimationProviderState extends State<_AnimationProvider>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const child = Card(
      color: Colors.yellowAccent,
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Icon(
          Icons.star,
          size: 50,
        ),
      ),
    );

    return ListView(
      children: [
        PhoneFrame(
          title: SlideExample.title,
          child: SlideExample(
            animation: _controller,
            child: child,
          ),
        ),
        PhoneFrame(
          title: ScaleExample.title,
          child: ScaleExample(
            animation: _controller,
            child: child,
          ),
        ),
      ],
    );
  }
}
