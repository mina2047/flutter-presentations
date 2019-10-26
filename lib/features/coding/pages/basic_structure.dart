import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:flutter_presentations/features/coding/pages/editor.dart';
import 'package:presentation/presentation.dart';

class BasicStructure extends StatefulWidget {
  const BasicStructure(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _BasicStructureState createState() => _BasicStructureState();
}

enum _Step {
  init,
  ctor,
  properties,
  build,
  next,
}

class _BasicStructureState extends State<BasicStructure>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  CrossFadeState _ctorState = CrossFadeState.showFirst;
  CrossFadeState _propState = CrossFadeState.showFirst;
  CrossFadeState _buildState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.ctor,
        forward: () => setState(() => _ctorState = CrossFadeState.showSecond),
        reverse: () => setState(() => _ctorState = CrossFadeState.showFirst),
      )
      ..add(
        fromStep: _Step.ctor,
        toStep: _Step.properties,
        forward: () => setState(() => _propState = CrossFadeState.showSecond),
        reverse: () => setState(() => _propState = CrossFadeState.showFirst),
      )
      ..add(
        fromStep: _Step.properties,
        toStep: _Step.build,
        forward: () => setState(() => _buildState = CrossFadeState.showSecond),
        reverse: () => setState(() => _buildState = CrossFadeState.showFirst),
      )
      ..add(
        fromStep: _Step.build,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    super.dispose();
    _stateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Editor(
      simple,
      padding: const EdgeInsets.only(left: 60),
      children: [
        AnimatedCrossFade(
          crossFadeState: _ctorState,
          duration: const Duration(milliseconds: 600),
          firstChild: const SizedBox(width: double.infinity),
          secondChild: const Editor(ctor0, nested: true),
        ),
        AnimatedCrossFade(
          crossFadeState: _propState,
          duration: const Duration(milliseconds: 600),
          firstChild: const SizedBox(width: double.infinity),
          secondChild: const Editor(parameters1, nested: true),
        ),
        AnimatedCrossFade(
          crossFadeState: _buildState,
          duration: const Duration(milliseconds: 600),
          firstChild: const SizedBox(width: double.infinity),
          secondChild: const Editor(build2, nested: true),
        ),
      ],
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

const ctor0 = '''  const SimpleWidget({
    @required this.child,
    Key key,
  })  : assert(child != null),
        super(key: key);''';

const parameters1 = '''  final Widget child;''';

const build2 = '''
  @override
  Widget build(BuildContext context) {
    return Container();
  }''';
