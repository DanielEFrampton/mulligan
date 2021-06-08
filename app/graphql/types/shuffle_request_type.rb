module Types
  class ShuffleRequestType < Types::BaseInputObject
    argument :shuffle_type, String, required: true
    argument :repetitions, Int, required: true
    argument :config, Types::ShuffleConfigInputType, required: true
  end
end