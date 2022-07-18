import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({
    Key? key,
    this.color = const Color(0xFF332d2d),
    required this.text,
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
        fontSize: size == 0?Dimensions.font15:size,
      ),
    );
  }
}
