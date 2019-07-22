import 'package:animation_cheat_page/shared/material_import.dart';

class PhoneFrame extends StatelessWidget {
  const PhoneFrame({
    Key key,
    @required this.title,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 400,
          height: 300,
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(child: child),
          ),
        )
      ],
    );
  }
}
