require 'rails_helper'

RSpec.describe ShuffleData do
  context 'instance methods' do
    context 'final_order' do
      it 'returns array of cards in final order after shuffle' do
        cards =  [
          {
            name: "Ace of Spades"
          },
          {
            name: "7 of Diamonds"
          },
          {
            name: "Queen of Clubs"
          },
          {
            name: "Jack of Hearts"
          },
          {
            name: "2 of Clubs"
          },
          {
            name: "Ace of Hearts"
          },
          {
            name: "8 of Diamonds"
          },
          {
            name: "9 of Diamonds"
          }
        ]
        shuffle_type = "riffle"
        config_data = {
          batch_size_min: 1,
          batch_size_max: 2,
          split_margin_min: 0,
          split_margin_max: 1,
          random_seed: 12345
        }
        config = Config.new(config_data)
        expected_final_order = [
          {
            name: "2 of Clubs"
          },
          {
            name: "Ace of Spades"
          },
          {
            name: "7 of Diamonds"
          },
          {
            name: "Ace of Hearts"
          },
          {
            name: "Queen of Clubs"
          },
          {
            name: "Jack of Hearts"
          },
          {
            name: "8 of Diamonds"
          },
          {
            name: "9 of Diamonds"
          }
        ]

        shuffle_data = ShuffleData.new(shuffle_type, config, cards)

        expect(shuffle_data.final_order).to eq expected_final_order
      end
    end
  end
end