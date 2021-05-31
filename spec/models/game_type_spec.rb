require 'rails_helper'

RSpec.describe GameType, type: :model do
  context 'instatiation' do
    it 'can be instantiated' do
      game = Game.create!(name: 'Magic: the Gathering')
      new_game_type = GameType.create!(name: 'Commander', max_deck_size: 99, game: game)
    end

    it 'has the correct relationships' do
      should belong_to :game
    end

    it 'validates the correct parameters' do
      should validate_presence_of :max_deck_size
      should validate_presence_of :name
    end
  end
end
