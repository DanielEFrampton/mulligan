class Shuffle < ApplicationRecord
  belongs_to :deck
  validates_presence_of :shuffle_type, :batch_size_max, :batch_size_min, :repetitions, :split_margin_min, :split_margin_max
  enum shuffle_type: [:riffle, :algorithmic]
end
