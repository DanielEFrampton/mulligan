module Types
  class ShuffleConfigType < Types::BaseObject
    field :batch_size_min, Int, null: false
    field :batch_size_max, Int, null: false
    field :split_margin_min, Int, null: false
    field :split_margin_max, Int, null: false
    field :random_seed, GraphQL::Types::BigInt, null: true
  end
end