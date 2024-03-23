import 'package:flutter/material.dart' hide Colors;

import '../../../../core/ui/colors_brand.dart';

class ModalCase extends StatelessWidget {
  const ModalCase(
    this.title,
    this.widgetBody, {
    this.height = 560,
    this.width = 340,
    super.key,
  });

  final String title;
  final Widget widgetBody;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white[0],
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: height,
              width: width,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 32),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Roboto Condensed',
                              fontSize: 22,
                              color: Colors.jelly[40],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child:  Icon(
                              Icons.cancel_rounded,
                              color: Colors.jelly[40],
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height - 84,
                    child: SingleChildScrollView(child: widgetBody),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
