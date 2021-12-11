import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final double? maxHeight;
  final double? minHeight;
  final String? title;

  const Header({Key? key, this.maxHeight, this.minHeight, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        return Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: AlignmentTween(
                      begin: Alignment.bottomLeft, end: Alignment.bottomLeft)
                  .evaluate(animation),
              child: Container(
                padding: EdgeInsets.only(
                    bottom: Dimens.size12,
                    left: Tween<double>(begin: Dimens.size24, end: 0.0)
                        .evaluate(animation)),
                child: Text(
                  "$title",
                  style: TextStyle(
                    fontSize:
                        Tween<double>(begin: Dimens.size20, end: Dimens.size20)
                            .evaluate(animation),
                    color: Palette.dark1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight!) / (maxHeight! - minHeight!);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }
}
