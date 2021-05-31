require 'rails_helper'

RSpec.describe DeckCard, type: :model do
  context 'instantiation' do
    it 'can be instantiated' do
      new_game = Game.new(name: 'Standard Playing Cards')
      new_type = GameType.new(name: 'Poker', max_deck_size: 52, game: new_game)
      new_deck = Deck.new(name: 'Poker Deck', game_type: new_type)
      new_card = Card.new(name: 'Ace', suit: 'Spades', color: 'Black')
      new_deck_card = DeckCard.new(deck: new_deck, card: new_card)
      expect(new_deck_card).to be_instance_of(DeckCard)
    end
    
    it 'has the right relationships' do
      should belong_to :card
      should belong_to :deck
    end
  end
end
