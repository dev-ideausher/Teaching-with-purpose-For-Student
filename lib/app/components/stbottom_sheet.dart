import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';


// ignore: must_be_immutable
class ResponseBottomSheet extends StatefulWidget {
  final Widget bottomSheetImg;
  final String title;
  final String text1;
  final String text2;
  final void Function(double) onTap;
  
  const ResponseBottomSheet(
      {super.key,
      required this.bottomSheetImg,
      required this.title,
      required this.text1,
      required this.onTap,
      required this.text2,
});

  @override
  State<ResponseBottomSheet> createState() => _ResponseBottomSheetState();
}

class _ResponseBottomSheetState extends State<ResponseBottomSheet> {
  
  Future<bool> onWillPop() async {
    return false;
  }

  double selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: MediaQuery.of(context).viewInsets,
            decoration: BoxDecoration(
              borderRadius:const BorderRadius.vertical(top: Radius.circular(30)),
              color: context.kWhite,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(39, 29, 39, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
                  ),
                  8.kheightBox,
                  SizedBox(
                    width: 200.kw,
                    height: 200.kh,
                    child: widget.bottomSheetImg,
                  ),
                  8.kheightBox,
                  Text(
                    widget.text1,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500,color: context.kLightTextColor),
                  ),
                  24.kheightBox,
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                     setState(() {
                       selectedRating = rating;
                     });
                    },
                  ),
                  48.kheightBox,
                  InkWell(
                    onTap: (){
                    widget.onTap(selectedRating);
                    },
                    child: Text(
                      widget.text2,
                      style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600,color: context.kPrimary,textDecoration: TextDecoration.underline),
                    ),
                  ),
                  36.kheightBox,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
