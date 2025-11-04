// lib/models/card.dart

enum Suit { hearts, diamonds, clubs, spades }

enum Rank {
  ace,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
}

class PlayingCard {
  final Suit suit;
  final Rank rank;

  const PlayingCard({required this.suit, required this.rank});

  /// Returns the display name of the rank (e.g., "Ace", "2", "Jack").
  String get rankName {
    switch (rank) {
      case Rank.ace:
        return 'Ace';
      case Rank.two:
        return '2';
      case Rank.three:
        return '3';
      case Rank.four:
        return '4';
      case Rank.five:
        return '5';
      case Rank.six:
        return '6';
      case Rank.seven:
        return '7';
      case Rank.eight:
        return '8';
      case Rank.nine:
        return '9';
      case Rank.ten:
        return '10';
      case Rank.jack:
        return 'Jack';
      case Rank.queen:
        return 'Queen';
      case Rank.king:
        return 'King';
    }
  }

  /// Returns the display name of the suit (e.g., "Hearts").
  String get suitName {
    switch (suit) {
      case Suit.hearts:
        return 'Hearts';
      case Suit.diamonds:
        return 'Diamonds';
      case Suit.clubs:
        return 'Clubs';
      case Suit.spades:
        return 'Spades';
    }
  }

  /// Returns a human-readable representation, e.g., "Ace of Spades".
  @override
  String toString() => '$rankName of $suitName';
}