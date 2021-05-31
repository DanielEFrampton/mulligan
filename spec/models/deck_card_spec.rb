require 'rails_helper'

RSpec.describe DeckCard, type: :model do
  context 'instantiation' do
    it 'can be instantiated' do
      new_game = Game.create!(name: 'Standard Playing Cards')
      new_type = GameType.create!(name: 'Poker', max_deck_size: 52, game: new_game)
      new_deck = Deck.create!(name: 'Poker Deck', game_type: new_type)
      new_card = Card.create!(name: 'Ace', suit: 'Spades', color: 'Black')
      new_deck_card = DeckCard.create!(deck: new_deck, card: new_card)
      expect(new_deck_card).to be_instance_of(DeckCard)
    end
    
    it 'has the right relationships' do
      should belong_to :card
      should belong_to :deck
    end
  end
end
