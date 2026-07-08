import 'package:flutter/material.dart';
import 'package:flutter_core_package/flutter_core_package.dart';

class ShowMoreTextWidget extends StatefulWidget {
  const ShowMoreTextWidget({
    required this.text,
    this.textStyle,
    this.maxLength = 100,
    this.showMoreText = 'Show More',
    this.showLessText = 'Show Less',
    super.key,
  });

  final String text;
  final TextStyle? textStyle;
  final int maxLength;
  final String showMoreText;
  final String showLessText;

  @override
  State<ShowMoreTextWidget> createState() => _ShowMoreTextWidgetState();
}

class _ShowMoreTextWidgetState extends State<ShowMoreTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > widget.maxLength) {
      firstHalf = widget.text.substring(0, widget.maxLength);
      secondHalf = widget.text.substring(widget.maxLength, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf, style: widget.textStyle)
          : Column(
              children: <Widget>[
                Text(flag ? '$firstHalf...' : (firstHalf + secondHalf), style: widget.textStyle),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? widget.showMoreText : widget.showLessText,
                        style: AppTextStyle.overlineMedium.copyWith(color: context.colorScheme.primary),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
