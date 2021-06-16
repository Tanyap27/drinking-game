import 'package:cardgame/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'theme.dart' as Theme;
import 'package:flare_flutter/flare_actor.dart';
import 'package:flip_card/flip_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  int sipCount = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //hides status bar
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      theme: Theme.mainThemeData,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> drinkingRules = [
    "Rhyme Round",
    "Waterfall",
    "Categories",
    "Most likely to",
    "Question Master",
    "Put a Sip to the Cup"
  ];

  List<Widget> ruleCardList = new List();
  bool shouldFlipCard = true;

  void initializeRuleCards() {
    shouldFlipCard = true;
    for (int i = 0; i < 8; i++) {
      Card currentCard = createRuleCard();

      ruleCardList.add(Positioned(
        child: Draggable(
          onDragEnd: (drag) {
            removeRuleCardFromStack();
          },
          childWhenDragging: Container(),
          feedback: currentCard,
          child: currentCard,
        ),
      ));
    }
  }

  Text pickRandomRule() {
    return Text((drinkingRules..shuffle()).first,
        style: Theme.mainThemeData.textTheme.body1);
  }

  Card createRuleCard() {
    Text randomRule = pickRandomRule();
    return Card(
      color: Theme.mainThemeData.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        width: 250,
        height: 400,
        child: (randomRule.data == "Waterfall")
            ? createWaterfallRuleCard(randomRule)
            : (randomRule.data == "Put a Sip to the Cup")
                ? createSipCounterRuleCard(randomRule)
                : (randomRule.data == "Rhyme Round")
                    ? createRhymeRuleCard(randomRule)
                    : (randomRule.data == "Categories")
                        ? createCategoryRuleCard(randomRule)
                        : (randomRule.data == "Most likely to")
                            ? createMostLikelyRuleCard(randomRule)
                            : (randomRule.data == "Question Master")
                                ? createQuestionMasterRuleCard(randomRule)
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Flexible(child: randomRule)
                                    ],
                                  ),
      ),
    );
  }

  Widget createWaterfallRuleCard(Text ruleText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("\n"),
        Flexible(child: ruleText),
        SizedBox(
          height: 280,
          width: 280,
          child: FlareActor(
            'assets/water-load.flr',
            animation: 'flow',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget createRhymeRuleCard(Text ruleText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 120,
          width: 120,
          child: FlareActor(
            'assets/DuplicateBeer.flr',
            animation: 'duplicate',
            fit: BoxFit.contain,
          ),
        ),
        Flexible(child: ruleText),
      ],
    );
  }

  Widget createCategoryRuleCard(Text ruleText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 120,
          width: 120,
          child: FlareActor(
            'assets/DuplicateBeer.flr',
            animation: 'duplicate',
            fit: BoxFit.contain,
          ),
        ),
        Flexible(child: ruleText),
      ],
    );
  }

  Widget createMostLikelyRuleCard(Text ruleText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 120,
          width: 120,
          child: FlareActor(
            'assets/GrowingBeer.flr',
            animation: 'grow',
            fit: BoxFit.contain,
          ),
        ),
        Flexible(child: ruleText),
      ],
    );
  }

  Widget createQuestionMasterRuleCard(Text ruleText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 120,
          width: 120,
          child: FlareActor(
            'assets/GrowingBeer.flr',
            animation: 'grow',
            fit: BoxFit.contain,
          ),
        ),
        Flexible(child: ruleText),
      ],
    );
  }

  Widget createSipCounterRuleCard(Text ruleText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 120,
          width: 120,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  sipCount++;
                });
              },
              child: SizedBox(
                height: 120,
                width: 120,
                child: FlareActor('assets/GrowingBeer.flr',
                    animation: 'grow', fit: BoxFit.contain),
              )),
        ),
        Flexible(child: ruleText),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    initializeRuleCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.mainThemeData.primaryColor,
      body: Center(
        child: Column(
          children: <Widget>[
            buildTopBar(),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: (ruleCardList.isNotEmpty)
                    ? FlipCard(
                        front: buildFrontCard(),
                        back: buildCardStack(),
                        onFlipDone: disableCardFlip,
                        flipOnTouch: shouldFlipCard)
                    : buildGameOver(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildFrontCard() {
    return Card(
      color: Theme.mainThemeData.accentColor, //orange//white
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
          width: 250,
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: Text(
                'Draw',
                style: Theme.mainThemeData.textTheme.button,
              ))
            ],
          )),
    );
  }

  void disableCardFlip(bool a) {
    shouldFlipCard = false;
  }

  Stack buildCardStack() {
    return Stack(alignment: Alignment.center, children: ruleCardList);
  }

  removeRuleCardFromStack() {
    setState(() {
      if (ruleCardList.isNotEmpty) {
        ruleCardList.removeLast();
      }
    });
  }

  Column buildGameOver() {
    return Column(
      children: <Widget>[
        Text("\n\nGame Over", style: Theme.mainThemeData.textTheme.headline),
        SizedBox(
          height: 180,
          width: 180,
          child: FlareActor('assets/Cheers.flr',
              animation: 'prost', fit: BoxFit.contain),
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                initializeRuleCards();
                sipCount = 0;
              });
            },
            child: Text("Play again"))
      ],
    );
  }
}
