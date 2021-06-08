class ShuffleServiceSerializer
  include JSONAPI::Serializer

  attributes :deck_before, :deck_after
  has_many :shuffles, serializer: ShuffleDataSerializer
end