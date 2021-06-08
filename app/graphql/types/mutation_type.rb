module Types
  class MutationType < Types::BaseObject
    field :shuffle, mutation: Mutations::ShuffleMutation
  end
end
