import 'package:flutter/material.dart';

typedef SearchCallback = Function(String s);

class SearchTextField extends StatelessWidget {
  final Icon? suffixIcon;
  final String? hintText;
  final Color fillColor;
  final TextEditingController? controller;
  final SearchCallback? searchCallback;
  final bool autoFocus;

  const SearchTextField({
    Key? key,
    this.hintText,
    this.suffixIcon,
    required this.fillColor,
    required this.searchCallback,
    required this.controller,
    this.autoFocus = true,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enableInteractiveSelection: false,
      textAlignVertical: TextAlignVertical.center,
      onChanged: searchCallback,
      autofocus: autoFocus,
      textInputAction: TextInputAction.search,
      cursorColor: Colors.white,
      style: const TextStyle(fontSize: 18,color: Colors.white),
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: const Icon(Icons.search),
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.yellow,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow[100]!,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.yellow,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        ),
      );
  }
}
