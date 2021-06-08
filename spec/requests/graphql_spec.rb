require 'rails_helper'

RSpec.describe 'POST /graphql endpoint', type: :request do
  context 'shuffle mutation' do
    it 'returns a shuffled deck and batch information' do
      request = <<-REQUEST
        mutation {
          shuffle(input: 
            {
              deck: [
                { name: "Ace of Spades" },
                { name: "7 of Diamonds" },
                { name: "Queen of Clubs" },
                { name: "Jack of Hearts" },
                { name: "2 of Clubs" },
                { name: "Ace of Hearts" },
                { name: "8 of Diamonds" },
                { name: "9 of Diamonds" }
              ],
              shuffleRequests: [
                {
                  shuffleType: "riffle",
                  repetitions: 1,
                  config: {
                    batchSizeMin: 1,
                    batchSizeMax: 2,
                    splitMarginMin: 0,
                    splitMarginMax: 1,
                    randomSeed: 12345
                  }
                }
              ]
            }
          ) {
            deckAfter {
              name
            }
            deckBefore {
              name
            }
            shuffles {
              shuffleType
              config {
                batchSizeMin
                batchSizeMax
                splitMarginMin
                splitMarginMax
                randomSeed
              }
              splitPoint
              finalOrder {
                name
              }
              piles {
                name
              }
              batches {
                number
                sourcePile
                cards {
                  name
                }
              }
            }
          }
        }
      REQUEST
      request_object = { "query" => request }
      expected_response = {
        "data" => {
          "shuffle" => {
            "deckAfter" => [
              {
                "name" => "2 of Clubs"
              },
              {
                "name" => "Ace of Spades"
              },
              {
                "name" => "7 of Diamonds"
              },
              {
                "name" => "Ace of Hearts"
              },
              {
                "name" => "Queen of Clubs"
              },
              {
                "name" => "Jack of Hearts"
              },
              {
                "name" => "8 of Diamonds"
              },
              {
                "name" => "9 of Diamonds"
              }
            ],
            "deckBefore" => [
              {
                "name" => "Ace of Spades"
              },
              {
                "name" => "7 of Diamonds"
              },
              {
                "name" => "Queen of Clubs"
              },
              {
                "name" => "Jack of Hearts"
              },
              {
                "name" => "2 of Clubs"
              },
              {
                "name" => "Ace of Hearts"
              },
              {
                "name" => "8 of Diamonds"
              },
              {
                "name" => "9 of Diamonds"
              }
            ],
            "shuffles" => [
              {
                "shuffleType" => "riffle",
                "config" => {
                  "batchSizeMin" => 1,
                  "batchSizeMax" => 2,
                  "splitMarginMin" => 0,
                  "splitMarginMax" => 1,
                  "randomSeed" => "12345"
                },
                "splitPoint" => 4,
                "finalOrder" => [
                  {
                    "name" => "2 of Clubs"
                  },
                  {
                    "name" => "Ace of Spades"
                  },
                  {
                    "name" => "7 of Diamonds"
                  },
                  {
                    "name" => "Ace of Hearts"
                  },
                  {
                    "name" => "Queen of Clubs"
                  },
                  {
                    "name" => "Jack of Hearts"
                  },
                  {
                    "name" => "8 of Diamonds"
                  },
                  {
                    "name" => "9 of Diamonds"
                  }
                ],
                "piles" => [
                  [
                    {
                      "name" => "Ace of Spades"
                    },
                    {
                      "name" => "7 of Diamonds"
                    },
                    {
                      "name" => "Queen of Clubs"
                    },
                    {
                      "name" => "Jack of Hearts"
                    }
                  ],
                  [
                    {
                      "name" => "2 of Clubs"
                    },
                    {
                      "name" => "Ace of Hearts"
                    },
                    {
                      "name" => "8 of Diamonds"
                    },
                    {
                      "name" => "9 of Diamonds"
                    }
                  ]
                ],
                "batches" => [
                  {
                    "number" => 5,
                    "sourcePile" => 2,
                    "cards" => [
                      {
                        "name" => "2 of Clubs"
                      }
                    ]
                  },
                  {
                    "number" => 4,
                    "sourcePile" => 1,
                    "cards" => [
                      {
                        "name" => "Ace of Spades"
                      },
                      {
                        "name" => "7 of Diamonds"
                      }
                    ]
                  },
                  {
                    "number" => 3,
                    "sourcePile" => 2,
                    "cards" => [
                      {
                        "name" => "Ace of Hearts"
                      }
                    ]
                  },
                  {
                    "number" => 2,
                    "sourcePile" => 1,
                    "cards" => [
                      {
                        "name" => "Queen of Clubs"
                      },
                      {
                        "name" => "Jack of Hearts"
                      }
                    ]
                  },
                  {
                    "number" => 1,
                    "sourcePile" => 2,
                    "cards" => [
                      {
                        "name" => "8 of Diamonds"
                      },
                      {
                        "name" => "9 of Diamonds"
                      }
                    ]
                  }
                ]
              }
            ]
          }
        }
      }
      post '/graphql', params: request_object
      parsed_response = ActiveSupport::JSON.decode(response.body)
      expect(parsed_response).to eq expected_response
    end
  end
end