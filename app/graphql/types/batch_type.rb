module Types
  class BatchType < Types::BaseObject
    field :number, Int, null: false
    field :source_pile, Int, null: false
    field :cards, [Types::CardType], null: false
  end
end