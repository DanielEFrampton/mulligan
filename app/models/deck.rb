class Deck < ApplicationRecord
  belongs_to :game_type
  has_many :deck_cards
  has_many :cards, through: :deck_cards
  has_many :shuffles
end
