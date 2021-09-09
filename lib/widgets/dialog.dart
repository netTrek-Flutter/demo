import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  buildInDefaultContainer(
    DialogOpeningWidget(),
  );
}

class DialogOpeningWidget extends StatefulWidget {
  const DialogOpeningWidget({Key? key}) : super(key: key);

  @override
  _DialogOpeningWidgetState createState() => _DialogOpeningWidgetState();
}

class _DialogOpeningWidgetState extends State<DialogOpeningWidget> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (context) {
              var textField = TextField(
                controller: TextEditingController(),
              );

              return Dialog(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('Dialog'),
                  ),
                  body: Column(
                    children: [
                      Spacer(),
                      textField,
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(
                                context, textField.controller!.value.text),
                            child: Text('Submit'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ).then(
            (value) => setState(() => result = value),
          ),
          child: Text(
            'Open Dialog',
          ),
        ),
        Spacer(),
        Text(
          result ?? '---',
          textAlign: TextAlign.center,
        ),
        Spacer()
      ],
    );
  }
}
