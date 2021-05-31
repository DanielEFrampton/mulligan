require 'rails_helper'

RSpec.describe GameType, type: :model do
  context 'instatiation' do
    it 'can be instantiated' do
      game = Game.new(name: 'Magic: the Gathering')
      new_game_type = GameType.new(name: 'Commander', max_deck_size: 99, game: game)
    end

    it 'has the correct relationships' do
      should belong_to :game
    end
  end
end
