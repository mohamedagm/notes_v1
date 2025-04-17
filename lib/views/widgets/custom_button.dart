import 'package:flutter/material.dart';
import 'package:notes_v1/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    super.key,
    required this.childtext,
    this.isLoading = false,
  });
  final String childtext;
  final bool isLoading;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child:
              isLoading
                  ? CircularProgressIndicator()
                  : Text(
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
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8), // ✅ جعل الحواف دائرية
        ),
      ),
    );
  }
}
