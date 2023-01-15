import 'package:flutter/material.dart';

import 'generic_form_field.widget.dart';

class AbilityLineWidget extends StatelessWidget {
  const AbilityLineWidget({
    required this.controller,
    required this.label,
    required this.onPressed,
    this.isRequired = false,
    this.showAddIcon = true,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool isRequired;
  final bool showAddIcon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GenericFormFieldWidget(
              controller: controller,
              label: label,
              flex: 2,
              isRequired: isRequired,
            ),
            showAddIcon
                ? IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
}
