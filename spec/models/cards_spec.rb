require 'rails_helper'

RSpec.describe Card, type: :model do
  context 'instantiation' do
    it 'can instantiate' do
      new_card = Card.new(name: 'Ace', suit: 'Spades', color: 'Black')
      expect(new_card).to be_instance_of(Card)
    end
  end

  context 'relationships' do
    it 'has the correct relationships' do
      should have_many :deck_cards
      should have_many(:decks).through(:deck_cards)
    end
  end
end