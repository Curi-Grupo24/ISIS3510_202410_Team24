import 'package:flutter/material.dart' hide Colors;

import '../../../../core/ui/colors_brand.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({
    required this.title,
    required this.detail,
    required this.onTap,
    super.key,
  });

  final String title;
  final String detail;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 0.5,
          borderOnForeground: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.gray[90],
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width-74,
                      child: Text(
                        detail,
                        style: TextStyle(
                          color: Colors.gray[70],
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.gray[70],
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      );
}
