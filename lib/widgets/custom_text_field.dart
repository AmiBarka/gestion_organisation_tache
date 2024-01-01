import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:organisation_tache/widgets/constance.dart';

class CustomField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;

  const CustomField({
    Key? key,
    required this.label,
    this.isPassword = false,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? obscureText : false,
        style: TextStyle(color: Colors.black), // Couleur du texte
        decoration: InputDecoration(
          fillColor: Colors.grey[200], // Couleur de fond grise
          filled: true,
          border: InputBorder.none, // Pas de bordure
          hintText: widget.label,
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: obscureText
                      ? const Icon(CupertinoIcons.eye_slash_fill,
                          color: primaryColor)
                      : const Icon(CupertinoIcons.eye_solid,
                          color: primaryColor),
                )
              : null,
        ),
      ),
    );
  }
}
