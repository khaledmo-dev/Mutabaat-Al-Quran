import 'package:flutter/material.dart';
import 'package:quran_test/services/localization_service.dart';
// import 'package:manhaj/services/translation_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';

class BaseBottomBar extends StatelessWidget {
  const BaseBottomBar({
    super.key,
    required this.views,
    required this.currentIndex,
    required this.setIndex,
  });

  final List views;
  final int currentIndex;
  final Function(int index) setIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE3E3E3), width: .5)),
      ),
      child: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var i = 0; i < views.length; i++)
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      setIndex(i);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            currentIndex == i
                                ? views[i]['icon-bold']
                                : views[i]['icon-light'],
                            size: 26,
                            color: currentIndex == i ? kcPrimaryColor : null,
                          ),
                          verticalSpaceTiny,
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              (views[i]['title'] as String).translate(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:
                                      currentIndex == i ? kcPrimaryColor : null,
                                  fontSize: 12,
                                  fontWeight: currentIndex == i
                                      ? FontWeight.bold
                                      : null),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
