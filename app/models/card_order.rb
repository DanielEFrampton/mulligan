class CardOrder < ApplicationRecord
  belongs_to :deck_card
  belongs_to :shuffle

  validates_presence_of :batch, :pile, :repetition, :position
end
