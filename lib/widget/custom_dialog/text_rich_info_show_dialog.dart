import 'package:flutter/material.dart';

import 'custom_dialog.dart';

class TextRichInfoShowDialog extends StatelessWidget {
  const TextRichInfoShowDialog({
    Key? key,
    required this.text,
    required this.title,
    required this.description,
  }) : super(key: key);

  
  final Widget? text;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          WidgetSpan(
            child: text!,
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>  CustomDialog(
                    title: title!,
                    description: description!,
                    buttonText: "OK",
                  ),
                );
              },
              child: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
