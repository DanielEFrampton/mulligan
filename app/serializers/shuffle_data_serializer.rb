class ShuffleDataSerializer
  include JSONAPI::Serializer

  attributes :shuffle_type, :config, :split_point, :final_order, :piles, :batches
end