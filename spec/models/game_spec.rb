require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'instatiation' do
    it 'can instatiate' do
      new_game = Game.new(name: 'Magic: the Gathering')
      expect(new_game).to be_instance_of(Game)
    end
  end
end
