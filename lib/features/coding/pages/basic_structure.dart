import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:flutter_presentations/features/coding/pages/editor.dart';

class BasicStructure extends StatefulWidget {
  @override
  _BasicStructureState createState() => _BasicStructureState();
}

class _BasicStructureState extends State<BasicStructure>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          crossFadeState = crossFadeState == CrossFadeState.showFirst
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst;
        });
      },
      child: Editor(
        simple,
        padding: const EdgeInsets.only(left: 60),
        children: [
          AnimatedCrossFade(
            crossFadeState: crossFadeState,
            duration: const Duration(milliseconds: 600),
            firstChild: const SizedBox(width: double.infinity),
            secondChild: const Editor(ctor0, nested: true),
          ),
          const Editor(parameters1, nested: true),
          const Editor(build2, nested: true),
        ],
      ),
    );
  }
}

const simple = '''
class SimpleWidget extends StatelessWidget {
  {0}
  {1}
  {2}
}
''';

const ctor0 = '''
  const SimpleWidget({
    @required this.child,
    Key key,
  })  : assert(child != null),
        super(key: key);''';

const parameters1 = '''
  final Widget child;''';

const build2 = '''
  @override
  Widget build(BuildContext context) {
    return Container();
  }''';
