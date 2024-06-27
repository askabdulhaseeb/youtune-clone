import 'package:flutter/material.dart';

import '../../utilities/app_images.dart';

enum YouTubeLogoStyle { style1, style2 }

class YoutubeLogo extends StatelessWidget {
  const YoutubeLogo({
    this.size = 16,
    this.logoStyle = YouTubeLogoStyle.style1,
    super.key,
  });
  final double size;
  final YouTubeLogoStyle logoStyle;

  @override
  Widget build(BuildContext context) {
    return logoStyle == YouTubeLogoStyle.style1
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                AppImages.youtube,
                width: size + (size / 3),
                height: size + (size / 3),
              ),
              const SizedBox(width: 2),
              Text(
                'YouTube',
                style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
              ),
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'You',
                style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Tube',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
  }
}
