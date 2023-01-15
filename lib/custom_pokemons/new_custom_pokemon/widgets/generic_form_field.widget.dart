import 'package:flutter/material.dart';

class GenericFormFieldWidget extends StatelessWidget {
  const GenericFormFieldWidget({
    required this.label,
    required this.flex,
    required this.controller,
    this.isRequired = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final int flex;
  final bool isRequired;

  @override
  Widget build(BuildContext context) => Flexible(
        flex: flex,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: label,
            ),
            validator: (value) {
              if (isRequired) {
                return value == null || value.isEmpty
                    ? 'Please, fill the $label field'
                    : null;
              }

              return null;
            },
          ),
        ),
      );
}
