import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.text, required this.icon});
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          margin: EdgeInsets.only(top: 6),
          decoration: shadowDecoration(borderRadius: BorderRadius.circular(5.spMin),width: 1.5),
          height: 32.spMin,
          width: 32.spMin,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SvgPicture.asset(icon,fit: BoxFit.contain,  colorFilter:ColorFilter.mode(AppColors.textColor, BlendMode.srcIn),
            ),
          ),
        ),
        SizedBox(width: 10.w,),
        Expanded(child: Text(text,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 36.spMin,color: AppColors.textColor),maxLines: 2,))
      ],),
    );
  }
}
