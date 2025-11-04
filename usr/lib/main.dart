import 'dart:math';
import 'package:flutter/material.dart';
import 'models/deck.dart';
import 'models/card.dart';
import 'widgets/playing_card_widget.dart';

void main() {
  runApp(const CardGameApp());
}

class CardGameApp extends StatelessWidget {
  const CardGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const GameTablePage(),
    );
  }
}

class GameTablePage extends StatefulWidget {
  const GameTablePage({super.key});

  @override
  State<GameTablePage> createState() => _GameTablePageState();
}

class _GameTablePageState extends State<GameTablePage> {
  final Deck _deck = Deck();
  final List<PlayingCard> _cardsOnTable = [];

  @override
  void initState() {
    super.initState();
    _deck.shuffle();
  }

  void _drawCard() {
    if (_deck.cards.isNotEmpty) {
      setState(() {
        _cardsOnTable.add(_deck.drawCard());
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No more cards in the deck!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _resetGame() {
    setState(() {
      _deck.reset();
      _deck.shuffle();
      _cardsOnTable.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Round Table Card Game'),
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
            tooltip: 'New Game',
          ),
        ],
      ),
      backgroundColor: Colors.green[900],
      body: LayoutBuilder(
        builder: (context, constraints) {
          final center = Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
          final radius = min(constraints.maxWidth, constraints.maxHeight) / 2.8;

          return Stack(
            children: [
              // The round table surface
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: radius * 2.2,
                    height: radius * 2.2,
                    decoration: BoxDecoration(
                      color: Colors.brown[800],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          spreadRadius: 8,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // The cards
              ..._buildCardPositions(center, radius),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _drawCard,
        tooltip: 'Draw Card',
        backgroundColor: Colors.amber[700],
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> _buildCardPositions(Offset center, double radius) {
    final List<Widget> cardWidgets = [];
    final cardCount = _cardsOnTable.length;

    for (int i = 0; i < cardCount; i++) {
      final card = _cardsOnTable[i];
      // Distribute cards evenly in a circle
      final angle = (2 * pi * i) / cardCount;
      
      // Calculate card position, subtracting half card size to center it
      final cardPosition = Offset(
        center.dx + radius * cos(angle) - 40, // card width / 2
        center.dy + radius * sin(angle) - 60, // card height / 2
      );

      cardWidgets.add(
        Positioned(
          left: cardPosition.dx,
          top: cardPosition.dy,
          child: PlayingCardWidget(card: card),
        ),
      );
    }
    return cardWidgets;
  }
}
