require 'rails_helper'

RSpec.describe 'POST /shuffle endpoint', type: :request do
  context 'when I send a post request to the shuffle endpoint' do
    before do
      post_params = {
        deck: [
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
        ],
        shuffles: [
          {
            type: "riffle",
            repetitions: 1,
            config: {
              batch_size_min: 1,
              batch_size_max: 2,
              split_margin_min: 1,
              split_margin_max: 2
            }
          }
        ]
      }
      post '/shuffle', params: post_params.to_json
    end

    it 'returns a 204 response' do
      expect(response.code).to eq '204'
    end
  end
end