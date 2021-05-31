# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

playing_cards = Game.create!(name: 'Playing Cards')
poker = GameType.create!(name: 'Poker', game: playing_cards, max_deck_size: 52)
poker_deck = Deck.create!(name: 'Poker Deck', game_type: poker)
suits = ['Clubs', 'Spades', 'Hearts', 'Diamonds']
values = ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King']
suits.each do |suit|
  values.each do |value|
    color = ['Clubs', 'Spades'].any?(suit) ? 'Black' : 'Red'
    poker_deck.cards.create!(name: value, color: color, suit: suit)
  end
end