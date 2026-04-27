import 'package:flutter/material.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/authentication/presentation/widgets/common_text_field/common_text_field.dart';

// ignore: must_be_immutable
class TitleTask extends StatelessWidget {
  TextEditingController taskTitleController;
  String text;

  TitleTask({super.key, required this.taskTitleController, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        // SizedBox(height: 8),
        CommonTextField(
          keyboardType: TextInputType.streetAddress,
          hintText: text,
          hintStyle: TextStyle(fontSize: 12, color: Colors.black54),
          controller: taskTitleController,
        ),
      ],
    );
  }
}
