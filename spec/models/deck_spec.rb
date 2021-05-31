require 'rails_helper'

RSpec.describe Deck, type: :model do
  context 'instatiation' do
    it 'can be instantiated' do
      new_game = Game.new(name: 'Magic: the Gathering')
      new_type = GameType.new(name: 'Commander', max_deck_size: 99, game: new_game)
      new_deck = Deck.new(name: 'Slivers FTW', game_type: new_type)
      expect(new_deck).to be_instance_of(Deck)
    end

    it 'has the correct relationships' do
      should belong_to :game_type
      should have_many :deck_cards
      should have_many(:cards).through(:deck_cards)
    end
  end
end
