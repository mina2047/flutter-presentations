import 'package:animation_cheat_page/shared/material_import.dart';

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({
    @required this.child,
    Key key,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
