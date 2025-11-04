import 'package:flutter/material.dart';
import '../models/card.dart';

class PlayingCardWidget extends StatelessWidget {
  final PlayingCard card;

  const PlayingCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 80,
        height: 120,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardText(card.rankName),
            Center(child: _buildCardSuitIcon()),
            Align(
              alignment: Alignment.bottomRight,
              child: _buildCardText(card.rankName),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: _cardColor(),
      ),
    );
  }

  Widget _buildCardSuitIcon() {
    return Icon(
      _cardIcon(),
      color: _cardColor(),
      size: 32,
    );
  }

  Color _cardColor() {
    switch (card.suit) {
      case Suit.hearts:
      case Suit.diamonds:
        return Colors.red;
      case Suit.clubs:
      case Suit.spades:
      default:
        return Colors.black;
    }
  }

  IconData _cardIcon() {
    switch (card.suit) {
      case Suit.hearts:
        return Icons.favorite;
      case Suit.diamonds:
        return Icons.diamond;
      case Suit.clubs:
        return Icons.grass; // Placeholder for clubs
      case Suit.spades:
        return Icons.psychology; // Placeholder for spades
    }
  }
}
