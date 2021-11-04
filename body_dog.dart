import 'package:flutter/material.dart';

Container dog(BuildContext context, double scale, Size size) {
  return Container(
    color: Colors.grey.withOpacity(0.1),
    padding: EdgeInsets.symmetric(vertical: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "一切取决于你自己，你应该更乐观一些",
              style: Theme.of(context)
                  .textTheme
                  .apply(fontSizeFactor: 1.5)
                  .subtitle1,
            ),
            SizedBox(
              height: 10 * scale,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: size.width / 3),
              child: Text(
                "凡事只求尽力，不要完美主义，因为很多结果的呈现，并非自己可以决定"
                "让女人念念不忘的是感情，让男人念念不忘的是感觉。感情随着时间沉淀，感觉随着时间消失",
                style: Theme.of(context)
                    .textTheme
                    .apply(fontSizeFactor: 1.2)
                    .bodyText1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            )
          ],
        ),
        Image.asset(
          "image/Home_3.jpg",
          fit: BoxFit.fitWidth,
          width: size.width / 3,
        )
      ],
    ),
  );
}
