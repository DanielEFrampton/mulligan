module Types
  class ShuffleConfigInputType < Types::BaseInputObject
    argument :batch_size_min, Int, required: true
    argument :batch_size_max, Int, required: true
    argument :split_margin_min, Int, required: true
    argument :split_margin_max, Int, required: true
    argument :random_seed, GraphQL::Types::BigInt, required: false
  end
end