import 'package:flutter/material.dart';

import '../../../responsive.dart';

Container lol(double scale, BuildContext context) {
  return Container(
    child: Row(
      children: [
        Expanded(
            child: Stack(
          children: [
            Image.asset("image/Home_4.jpg"),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 80 * scale),
              child: Column(
                children: [
                  Text(
                    "凡事都要学习看淡，再放下，不要斤斤计较，耿耿于怀\n",
                    style: Theme.of(context)
                        .textTheme
                        .apply(bodyColor: Colors.white, fontSizeFactor: 1.5)
                        .bodyText1,
                  ),
                  if (Responsive.isDesktop(context))
                    Column(
                      children: [
                        Text(
                          "不要打破砂锅问到底，因为最终的答案，是没有答案",
                          style: Theme.of(context)
                              .textTheme
                              .apply(
                                  bodyColor: Colors.white, fontSizeFactor: 1.1)
                              .bodyText1,
                        ),
                        Text(
                          " 有着一颗浪迹天涯的心，却在原地“画地为牢”",
                          style: Theme.of(context)
                              .textTheme
                              .apply(
                                  bodyColor: Colors.white, fontSizeFactor: 1.1)
                              .bodyText1,
                        ),
                        Text(
                          "人不了解，但是自己要懂自己，身边还有很多爱你的人，陪伴着你的人",
                          style: Theme.of(context)
                              .textTheme
                              .apply(
                                  bodyColor: Colors.white, fontSizeFactor: 1.1)
                              .bodyText1,
                        ),
                        Text(
                          "......\n",
                          style: Theme.of(context)
                              .textTheme
                              .apply(
                                  bodyColor: Colors.white, fontSizeFactor: 1.1)
                              .bodyText1,
                        ),
                        Text(
                          "了解详情>",
                          style: Theme.of(context)
                              .textTheme
                              .apply(
                                  bodyColor: Colors.white, fontSizeFactor: 1.1)
                              .bodyText1,
                        )
                      ],
                    )
                ],
              ),
            )
          ],
        )),
        SizedBox(
          width: 20 * scale,
        ),
        Expanded(
            child: Stack(
          children: [
            Image.asset("image/Home_5.jpg"),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 80 * scale),
              child: Column(
                children: [
                  Text(
                    "学会忘记，就是要我们减轻心灵的行李，放下精神的包袱，轻装上阵，同时，告别心灵的抑郁，走出情绪的低谷，以阳光般的心\n",
                    style: Theme.of(context)
                        .textTheme
                        .apply(
                            bodyColor: Color(0xFF00FF00), fontSizeFactor: 1.5)
                        .bodyText1,
                  ),
                  if (Responsive.isDesktop(context))
                    Column(
                      children: [
                        Text(
                          "为回忆过去而后悔的想死，展望未来因前途的迷茫而抑郁，所以现在是最幸福的时刻。",
                          style: Theme.of(context)
                              .textTheme
                              .apply(
                                  bodyColor: Color(0xFF00FF00),
                                  fontSizeFactor: 1.1)
                              .bodyText1,
                        ),
                        Text(
                          "冥想过往快乐的回忆\n",
                          style: Theme.of(context)
                              .textTheme
                              .apply(
                                  bodyColor: Color(0xFF00FF00),
                                  fontSizeFactor: 1.1)
                              .bodyText1,
                        ),
                        Text(
                          "了解详情>",
                          style: Theme.of(context)
                              .textTheme
                              .apply(
                                  bodyColor: Color(0xFF00FF00),
                                  fontSizeFactor: 1.1)
                              .bodyText1,
                        )
                      ],
                    )
                ],
              ),
            )
          ],
        ))
      ],
    ),
  );
}
