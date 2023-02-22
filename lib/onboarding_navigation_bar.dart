import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final int currentPage;
  final Function onSkip;
  final int totalPage;
  final Function? onFinish;
  final Widget? finishButton;
  final Widget? skipTextButton;
  final Color headerBackgroundColor;
  final Widget? leading;
  final Widget? middle;
  final Function? skipFunctionOverride;

  OnBoardingNavigationBar({
    required this.currentPage,
    required this.onSkip,
    required this.headerBackgroundColor,
    required this.totalPage,
    this.onFinish,
    this.finishButton,
    this.skipTextButton,
    this.leading,
    this.middle,
    this.skipFunctionOverride,
  });

  @override
  Size get preferredSize => Size.fromHeight(40);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
       if(headerBackgroundColor == Colors.transparent)
      {
        return AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(223, 247, 250, 1),
                  Color.fromRGBO(186, 233, 239, 1),
                ],
                stops: [0.5, 1.0],
              ),
            ),
          ),
        );
      }
    else
      {
    return AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(223, 247, 250, 1),
                Color.fromRGBO(186, 233, 239, 1),
              ],
              stops: [0.5, 1.0],
            ),
          ),
        ),
      automaticallyImplyLeading: false,
      leading: leading,
      actions: currentPage == totalPage - 1
          ? finishButton == null
              ? [SizedBox.shrink()]
              : [Container(
                  color: Colors.transparent,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => onFinish?.call(),
                    child: finishButton!,
                  )
                ),]
          : skipTextButton == null
              ? [SizedBox.shrink()]
              : [Container(
                  color: Colors.transparent,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      if (skipFunctionOverride == null) {
                        onSkip();
                      } else {
                        skipFunctionOverride!();
                      }
                    },
                    child: skipTextButton!,
                  ),
                )],

      backgroundColor: headerBackgroundColor,
      elevation: 0
    );
      }
  }
}
