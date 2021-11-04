import 'package:flutter/material.dart';

Container superCode(Size size, double scale, BuildContext context) {
  return Container(
    color: Colors.grey.withOpacity(0.1),
    width: size.width,
    child: Column(
      children: [
        SizedBox(
          height: 40 * scale,
        ),
        Text(
          "放松心情",
          style:
              Theme.of(context).textTheme.apply(fontSizeFactor: 1.2).subtitle1,
        ),
        SizedBox(
          height: 10 * scale,
        ),
        Container(
          constraints: BoxConstraints(maxWidth: size.width - 100),
          child: Text(
            "没人能将你打败，能打到你的只有你自己",
            style: Theme.of(context)
                .textTheme
                .apply(fontSizeFactor: 1.2)
                .bodyText1,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 20 * scale,
        ),
        Image.asset(
          "image/Home_1.jpg",
          width: size.width / 2,
        ),
        SizedBox(
          height: 40 * scale,
        ),
      ],
    ),
  );
}
