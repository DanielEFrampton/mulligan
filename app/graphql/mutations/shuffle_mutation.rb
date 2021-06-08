module Mutations
  class ShuffleMutation < Mutations::BaseMutation
    argument :deck, [Types::CardInputType], required: true
    argument :shuffle_requests, [Types::ShuffleRequestType], required: true

    field :deck_before, [Types::CardType], null: false
    field :deck_after, [Types::CardType], null: false
    field :shuffles, [Types::ShuffleType], null: false

    def resolve(deck:, shuffle_requests:)
      shuffles = ShuffleService.new(deck, shuffle_requests)
      shuffles.serialize
    end
  end
end

