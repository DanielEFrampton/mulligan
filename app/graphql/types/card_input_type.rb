module Types
  class CardInputType < Types::BaseInputObject
    argument :name, String, required: true
  end
end