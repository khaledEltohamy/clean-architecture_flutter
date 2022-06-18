import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ErrorScreen extends StatelessWidget {
  final String msg;
  const ErrorScreen({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${msg}"),
    );
  }
}
