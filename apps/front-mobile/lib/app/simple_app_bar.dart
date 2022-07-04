import 'package:flutter/material.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/complex_button.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar(this.pageTitle,
      {Key? key, this.backButton, this.height = 80})
      : super(key: key);

  final String pageTitle;

  final double height;

  final bool? backButton;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppBar(
            backgroundColor: AppTheme.of(context).primaryBackground,
            title: Text(
              pageTitle,
              style: AppTheme.of(context)
                  .title1
                  .override(fontFamily: 'Roboto Slab', fontSize: 32),
            ),
            leading: _getBackButton(context),
            elevation: 0,
            leadingWidth: 100,
          )
        ]));
  }

  Widget _getBackButton(BuildContext context, {String text = 'back'}) =>
      (backButton ?? false)
          ? InternalButtonWidget(
              text: text,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: AppTheme.of(context).primaryText,
                size: 24,
              ),
              onPressed: () async {
                Navigator.maybePop(context);
              },
              options: ComplexButtonOptions(
                  textStyle: AppTheme.of(context).title1.override(
                        fontFamily: 'Roboto Slab',
                        fontSize: 16,
                      ),
                  color: AppTheme.of(context).primaryBackground,
                  elevation: 1,
                  width: Size.infinite.width,
                  height: preferredSize.height,
                  borderRadius: BorderRadius.circular(0),
                  overlayColor: AppTheme.of(context).primaryBackground),
            )
          : Container();

  @override
  Size get preferredSize => Size.fromHeight(height);
}
