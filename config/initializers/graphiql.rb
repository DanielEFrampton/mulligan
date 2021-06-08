GraphiQL::Rails.config.initial_query = <<-QUERY
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
          repetitions: 2,
          config: {
            batchSizeMin: 1,
            batchSizeMax: 2,
            splitMarginMin: 0,
            splitMarginMax: 1,
            randomSeed: 12345
          }
        },
        {
          shuffleType: "riffle",
          repetitions: 1,
          config: {
            batchSizeMin: 1,
            batchSizeMax: 2,
            splitMarginMin: 0,
            splitMarginMax: 1
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
QUERY
