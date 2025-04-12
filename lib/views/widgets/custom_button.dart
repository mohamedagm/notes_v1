import 'package:flutter/material.dart';
import 'package:notes_v1/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.onTap, super.key, required this.childtext});
  final String childtext;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            childtext,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.circular(8), // ✅ جعل الحواف دائرية
        ),
      ),
    );
  }
}
