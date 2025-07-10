import 'package:flutter/material.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/constant.dart';
import 'package:note/utils/text_style.dart';

class categoryInputBottomSheet extends StatefulWidget {
  final Function() oneNote;
  final Function() oneNewCategory;
  const categoryInputBottomSheet({
    super.key, 
    required this.oneNote, 
    required this.oneNewCategory,
  });

  @override
  State<categoryInputBottomSheet> createState() => _categoryInputBottomSheetState();
}

class _categoryInputBottomSheetState extends State<categoryInputBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*1.5,
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.kDefaultPadding * 1.5),
        child: Column(
          children: [
            GestureDetector(
              onTap: widget.oneNote,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Create a New Note",
                  style:AppTextStyles.appDescriptionStyle ,
                  ),
                  Icon(Icons.arrow_right_outlined,),             
                ],
              ),
            ),
            SizedBox(height: 30,),
            Divider(
              color: AppColors.kWhiteColor.withOpacity(0.5),
              thickness: 2,
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: widget.oneNewCategory,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Create a New Note Category",
                  style:AppTextStyles.appDescriptionStyle ,
                  ),
                  Icon(Icons.arrow_right_outlined,),             
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}