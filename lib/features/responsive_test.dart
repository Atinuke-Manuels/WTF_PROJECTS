import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

const imagePath = 'assets/';

const mockUpHeight = 812;
const mockUpWidth = 375;

class ResponsiveTest extends StatelessWidget {
  const ResponsiveTest({super.key});


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scale = mockUpWidth/ width;
    final textScaleFactor = width / mockUpWidth;
    return PixelPerfect(
      scale: scale,
        assetPath: imagePath + 'profileImg.jpg',

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 15),
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30), // half of the width and height
                        child: Image.asset(
                          imagePath + 'profileImg.jpg',
                          // width: 60,
                          scale: scale,
                          height: 60,
                        ),
                      ),
                      for(var stats in userStats)...[
                        SizedBox(width: stats.leftPaddingFactor / mockUpWidth * width,),
                        Column(
                          children: [
                            Text(stats.value.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.5,
                            ),
                            ),
                            Text(
                              stats.name,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        )
                      ]
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}


class UserStats{
  final int value;
  final String name;
  final double leftPaddingFactor;

  UserStats({
    required this.value,
    required this.name,
    required this.leftPaddingFactor,
  });
}

final userStats = [
  UserStats(
      value: 210,
      name: 'post',
      leftPaddingFactor: 41,
  ),
  UserStats(
      value: 600,
      name: 'followers',
      leftPaddingFactor: 39,
  ),
  UserStats(
      value: 500,
      name: 'following',
      leftPaddingFactor: 24,
  ),
];