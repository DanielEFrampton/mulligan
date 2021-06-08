module Types
  class ShuffleType < Types::BaseObject
    field :name, String, null: false
    field :shuffle_type, String, null: false
    field :config, Types::ShuffleConfigType, null: false
    field :split_point, Int, null: false
    field :final_order, [Types::CardType], null: false
    field :piles, [[Types::CardType]], null: false
    field :batches, [Types::BatchType], null: false
  end
end