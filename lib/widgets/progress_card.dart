import 'package:flutter/material.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/constant.dart';
import 'package:note/utils/text_style.dart';

class ProgressCard extends StatefulWidget {

  final int CompletedTasks;
  final int totalTasks;
  const ProgressCard({
    super.key, 
    required this.CompletedTasks, 
    required this.totalTasks
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {

    //calculation for the completion percentage
    double completionPercetage = widget.totalTasks != 0? (widget.CompletedTasks/widget.totalTasks) * 100: 0;

    return Container(
      padding: EdgeInsets.all(AppConstants.kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width *0.6,
                child: Text("Today's Progress",
                style: AppTextStyles.appSubTitle,
                ),
              ),
              SizedBox(height: 8,),
              Text("You have completed ${widget.CompletedTasks} out of ${widget.totalTasks} task,\n keep up the progresss!",
              style: AppTextStyles.appDescriptionStyle.copyWith(
                color: AppColors.kWhiteColor.withOpacity(0.5),
              ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width *0.19,
                height: MediaQuery.of(context).size.width * 0.19,
                decoration: BoxDecoration(
                  gradient: AppColors().kPrimaryGradient,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    "${completionPercetage}%",
                  style: AppTextStyles.appSubTitle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}