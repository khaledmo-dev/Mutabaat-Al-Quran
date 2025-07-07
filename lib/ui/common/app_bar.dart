import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.actions,
    this.enableLeading = true,
    this.title,
    this.leading,
  });
  final Widget? title;
  final List<Widget>? actions;
  final bool enableLeading;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    bool isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return AppBar(
      toolbarHeight: 56,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: const Color(0xFFE3E3E3), // Border color
          height: 1.0,
        ),
      ),
      title: title,
      centerTitle: true,
      actions: actions?.map((e) => Center(child: e)).toList(),
      leading: enableLeading
          ? Center(
              child: leading ??
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      isEnglish
                          ? IconlyBold.arrow_left_square
                          : IconlyBold.arrow_right_square,
                    ),
                  ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
