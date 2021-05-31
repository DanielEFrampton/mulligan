require 'rails_helper'

RSpec.describe Shuffle, type: :model do
  it 'can be instantiated' do
    new_game = Game.create!(name: 'Magic: the Gathering')
    new_type = GameType.create!(name: 'Commander', max_deck_size: 99, game: new_game)
    new_deck = Deck.create!(name: 'Slivers FTW', game_type: new_type)
    new_shuffle = Shuffle.create!(
      batch_size_min: 1,
      batch_size_max: 3,
      repetitions: 3,
      split_margin_max: 1,
      split_margin_min: 0,
      shuffle_type: :riffle,
      deck: new_deck
    )
    expect(new_shuffle).to be_instance_of(Shuffle)
  end

  it 'should validate the correct parameters' do
    should validate_presence_of :batch_size_min
    should validate_presence_of :batch_size_max
    should validate_presence_of :repetitions
    should validate_presence_of :split_margin_max
    should validate_presence_of :split_margin_min 
    should validate_presence_of :shuffle_type

    should define_enum_for :shuffle_type
  end

  it 'should have the correct relationships' do
    should belong_to :deck
  end
end
