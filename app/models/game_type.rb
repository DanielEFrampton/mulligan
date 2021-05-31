class GameType < ApplicationRecord
  belongs_to :game

  validates_presence_of :max_deck_size, :name
end
