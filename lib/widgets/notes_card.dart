import 'package:flutter/material.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/constant.dart';
import 'package:note/utils/text_style.dart';

class NotesCard extends StatelessWidget {
  final String noteCategory;
  final noOfNotes;
  const NotesCard({
    super.key, 
    required this.noteCategory, 
    this.noOfNotes
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0,5),
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            noteCategory,
          style: AppTextStyles.appSubTitle.copyWith(
            fontWeight: FontWeight.w500,
          )
          ),
          Text(
            "$noOfNotes notes",
          style: AppTextStyles.appBody.copyWith(
            color: AppColors.kWhiteColor.withOpacity(0.5),
          )
          ),
        ],
      ),
    );
  }
}