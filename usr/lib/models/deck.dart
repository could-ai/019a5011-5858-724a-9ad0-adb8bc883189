// lib/models/deck.dart

import 'dart:math';
import 'card.dart';

class Deck {
  /// The list of remaining cards in the deck.
  final List<PlayingCard> cards;

  /// Constructs a new standard 52-card deck in order.
  Deck() : cards = _generateDeck();

  /// Generates a full 52-card deck combining all suits and ranks.
  static List<PlayingCard> _generateDeck() {
    final deck = <PlayingCard>[];
    for (final suit in Suit.values) {
      for (final rank in Rank.values) {
        deck.add(PlayingCard(suit: suit, rank: rank));
      }
    }
    return deck;
  }

  /// Shuffles the deck randomly.
  void shuffle() {
    cards.shuffle(Random());
  }

  /// Draws a card from the top (end) of the deck.
  ///
  /// Throws a StateError if the deck is empty.
  PlayingCard drawCard() {
    if (cards.isEmpty) {
      throw StateError('No cards left in the deck');
    }
    return cards.removeLast();
  }

  /// Resets the deck back to a full 52 cards in order.
  void reset() {
    cards
      ..clear()
      ..addAll(_generateDeck());
  }
}