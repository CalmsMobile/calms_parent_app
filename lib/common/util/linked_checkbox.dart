import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkedLabelCheckbox extends StatelessWidget {
  const LinkedLabelCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.isDisableTextClick,
    required this.onChanged,
    required this.onTextClick,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final bool isDisableTextClick;
  final ValueChanged<bool> onChanged;
  final Function onTextClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: 25,
        child: Row(
          children: <Widget>[
            Checkbox(
              tristate: true,
              shape: CircleBorder(),
              value: value,
              onChanged: (bool? newValue) {
                if (newValue != null) {
                  onChanged(newValue);
                } else {
                  onChanged(false);
                }
              },
            ),
            Expanded(
              child: RichText(
                text: isDisableTextClick
                    ? TextSpan(
                        text: label,
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            onTextClick();
                          },
                      )
                    : TextSpan(
                        text: label,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            onTextClick();
                          },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
