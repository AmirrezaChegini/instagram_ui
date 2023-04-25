import 'package:flutter/material.dart';

class EdtText extends StatefulWidget {
  const EdtText({
    super.key,
    required this.label,
    required this.inputType,
    this.isObsecure = false,
  });

  final String label;
  final TextInputType inputType;
  final bool isObsecure;

  @override
  State<EdtText> createState() => _EdtTextState();
}

class _EdtTextState extends State<EdtText> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        isFocused = !isFocused;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      focusNode: _focusNode,
      obscureText: widget.isObsecure,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 14,
          fontFamily: 'GM',
          color: isFocused
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColorLight,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark,
            width: 2,
          ),
        ),
      ),
    );
  }
}
