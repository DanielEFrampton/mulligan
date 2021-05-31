require 'rails_helper'

RSpec.describe CardOrder, type: :model do
  it 'can instantiate' do
    new_game = Game.create!(name: 'Standard Playing Cards')
    new_type = GameType.create!(name: 'Poker', max_deck_size: 52, game: new_game)
    new_deck = Deck.create!(name: 'Poker Deck', game_type: new_type)
    new_card = Card.create!(name: 'Ace', suit: 'Spades', color: 'Black')
    new_deck_card = DeckCard.create!(deck: new_deck, card: new_card)
    new_shuffle = Shuffle.create!(
      batch_size_min: 1,
      batch_size_max: 3,
      repetitions: 3,
      split_margin_max: 1,
      split_margin_min: 0,
      shuffle_type: :riffle,
      deck: new_deck
    )
    new_card_order = CardOrder.create!(
      shuffle: new_shuffle,
      deck_card: new_deck_card,
      position: 1,
      pile: 1,
      repetition: 1,
      batch: 1
    )
    expect(new_card_order).to be_instance_of(CardOrder)
  end

  it 'has the correct relationships' do
    should belong_to :shuffle
    should belong_to :deck_card
  end

  it 'validates the correct parameters' do
    should validate_presence_of :batch
    should validate_presence_of :pile
    should validate_presence_of :position
    should validate_presence_of :repetition
  end
end
