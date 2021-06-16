import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'theme.dart' as Theme;
import 'package:flare_flutter/flare_actor.dart';
import 'package:cardgame/main.dart';

int sipCount = MyApp().sipCount;

Expanded buildTopBar() {
  return Expanded(
      flex: 1,
      child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Text(
                "KING'S CUP",
                style: Theme.mainThemeData.textTheme.title,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: FlareActor('assets/SparklingBeer.flr',
                        animation: 'sparkle', fit: BoxFit.contain),
                  )),
              Text(
                "$sipCount Sips",
                style: Theme.mainThemeData.textTheme.subtitle,
              )
            ],
          )));
}