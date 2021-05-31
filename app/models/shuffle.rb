class Shuffle < ApplicationRecord
  belongs_to :deck
  has_one :previous_shuffle, class_name: 'Shuffle', foreign_key: 'previous_shuffle_id'
  has_many :card_orders
  validates_presence_of :shuffle_type, :batch_size_max, :batch_size_min, :repetitions, :split_margin_min, :split_margin_max
  enum shuffle_type: [:riffle, :algorithmic]
end
